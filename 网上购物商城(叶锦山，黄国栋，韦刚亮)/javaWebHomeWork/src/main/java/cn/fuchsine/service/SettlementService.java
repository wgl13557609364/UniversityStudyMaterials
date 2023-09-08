package cn.fuchsine.service;

import cn.fuchsine.dao.article.ArticleMapperDAo;
import cn.fuchsine.dao.order.OrderMapper;
import cn.fuchsine.dao.orderltem.OrderItemMapper;
import cn.fuchsine.dao.shopcar.ShopCarMapper;
import cn.fuchsine.pojo.Order;
import cn.fuchsine.pojo.ShopCar;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/14 21:26
 * @since 1.0.0
 */
public class SettlementService {
    public void settlementshop(List<ShopCar> list, double payPeice, Integer userid){
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
        ShopCarMapper shopCarMapper = sqlSession.getMapper(ShopCarMapper.class);
        ArticleMapperDAo articleMapperDAo = sqlSession.getMapper(ArticleMapperDAo.class);
        OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
        Order order = new Order();
        //获取当前时间
        Date date = new Date();
        //设置格式
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = formatter.format(date).replace("-","").replace(" ", "").replace(":", "");
        int number = (int)(Math.random()*100)+1;
        str="OP-"+str + number;
        order.setOrderCode(str);
        order.setCreateDate(date);
        order.setAmount(payPeice);
        order.setUserId(userid);
        //订单事务判断
        int orsertransaction = orderMapper.addOrder(order);
        if(orsertransaction!=1){
            return;
        }
        //删除已经提交订单的商品
        for (ShopCar shopCar : list) {
            int deleteshopcar = shopCarMapper.deleteshopcar(shopCar.getId());
            if(deleteshopcar!=1){
                return;
            }
            //获取库存中的数量
            int Inventory = articleMapperDAo.Inventory(shopCar.getArticleId());
            if(Inventory>=shopCar.getBuyNum()){
                int inventorytransaction = articleMapperDAo.upDataInventory(shopCar.getArticleId(), shopCar.getBuyNum());
                if(inventorytransaction!=1){
                    return;
                }
            }
            //在订单详情的添加
            int orderId = orderMapper.getOrderId(str);
//            sqlSession.commit();
            //订单详情中的事务判断
            int orderItemtransaction = orderItemMapper.addOrderItem(orderId, shopCar.getArticleId(), shopCar.getBuyNum());
            if(orderItemtransaction!=1){
                return;
            }
        }
        sqlSession.commit();
        sqlSession.close();
    }
}
