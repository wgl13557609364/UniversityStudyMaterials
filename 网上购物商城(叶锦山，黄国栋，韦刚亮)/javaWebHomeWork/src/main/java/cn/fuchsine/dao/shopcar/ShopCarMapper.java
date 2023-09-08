package cn.fuchsine.dao.shopcar;

import cn.fuchsine.pojo.ShopCar;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/8 4:46
 * @since 1.0.0
 */
public interface ShopCarMapper {
    List<ShopCar> findShopCar(@Param("id") Integer id);

    int addone(@Param("userid") Integer userid,@Param("articleid") Integer articleid);

    int lowerone(@Param("userid") Integer userid,@Param("articleid") Integer articleid);

    int deelete(@Param("userid") Integer userid,@Param("articleid") Integer articleid);

    ShopCar selectByname(@Param("userid") Integer userid,@Param("articleid") Integer articleid);

    int addshopcar(ShopCar shopCar);

    int upData(@Param("userid") Integer userid,@Param("newByNum") Integer newByNum,@Param("articleid") Integer articleid);

    int deleteshopcar(Integer id);

}
