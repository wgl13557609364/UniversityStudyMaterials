package cn.fuchsine.dao.article;

import cn.fuchsine.pojo.Article;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/9/29 17:10
 * @since 1.0.0
 */
public interface ArticleMapperDAo {
    List<Article> getListArticle();

    List<Article> getListArticled();

    int RecoverArticle(@Param("id") Integer id);

    @Select("select *from ec_article where id = #{id}")
    Article getArticleById(@Param("id")int id);

    //查商品库存数量
    int Inventory(Integer articleId);

    int getArticleMun(Integer articleId);

    int upDataInventory(@Param("articleId") Integer articleId,@Param("byNum") Integer byNum);

    int upDataDisable(Integer id);

    int updatasell(@Param("articleId") Integer articleId,@Param("pricr") Double pricr,@Param("discunt") Double discunt,@Param("storage")Integer storage);


    //    long
    //按关键字查询商品
    List<Article>findArticlesLikeTitle(@Param("title") String title);

    //按title查询商品
    List<Article>findArticlesLikeName(@Param("remark") String remark);

    //按title和type查询商品
    List<Article>findArticlesTitleType(@Param("title") String title,@Param("remark") String remark);

    List<Article>findyArticleByType(@Param("type") String type);


}
