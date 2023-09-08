package cn.fuchsine.service.shopcar;

import cn.fuchsine.dao.article.ArticleMapperDAo;
import cn.fuchsine.dao.article.articleMapperDapImpl;
import cn.fuchsine.dao.articleType.ArticleTypeImpl;
import cn.fuchsine.dao.shopcar.shopCarMapperImpl;
import cn.fuchsine.pojo.Article;
import cn.fuchsine.pojo.ShopCar;
import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author fuchsine
 * @date 2022/10/9 0:31
 * @since 1.0.0
 */
public class ShopCarServiceImpl implements ShopCarService{
    @Override
    public Map getArticelByUser(int id) {
        Map map = new HashMap();

        List<Article> listarticle = new ArrayList<>();
        List<Integer> listbuyNum = new ArrayList<>();
        //先通过用户id得到购物车表
        shopCarMapperImpl shopCarMapper = new shopCarMapperImpl();
        articleMapperDapImpl articleMapperDap = new articleMapperDapImpl();
        List<ShopCar> shopCarList = shopCarMapper.findShopCar(id);
        for (ShopCar shopCar : shopCarList) {
            int articleId = shopCar.getArticleId();
            listarticle.add(articleMapperDap.getArticleById(articleId));
            listbuyNum.add(shopCar.getBuyNum());
        }
        map.put("listarticle",listarticle);
        map.put("listbuyNum",listbuyNum);
        return map;
    }
}
