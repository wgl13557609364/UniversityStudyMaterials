package cn.fuchsine.dao.article;

import cn.fuchsine.pojo.Article;
import cn.fuchsine.util.MybatisUtil;
import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/9/29 17:13
 * @since 1.0.0
 */
public class articleMapperDapImpl implements ArticleMapperDAo {
    @Override
    public List<Article> getListArticle() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> listArticle = mapper.getListArticle();
        sqlSession.close();
        return listArticle;
    }

    @Override
    public List<Article> getListArticled() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> listArticle = mapper.getListArticled();
        sqlSession.close();
        return listArticle;
    }

    @Override
    public int RecoverArticle(Integer id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int i = mapper.RecoverArticle(id);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }


    @Test
    public void re(){
        System.out.println(RecoverArticle(1));
    }


    @Test
    public void t() {
        List<Article> listArticle = getListArticle();
        Object json = JSON.toJSON(listArticle);
        System.out.println(json.toString());
    }

    @Override
    public Article getArticleById(int id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        Article article = mapper.getArticleById(id);
        sqlSession.close();
        return article;
    }

    @Override
    public int Inventory(Integer articleId) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int inventory = mapper.Inventory(articleId);
        sqlSession.close();
        return inventory;
    }

    @Test
    public void e() {
        int inventory = Inventory(1);
        System.out.println(inventory);
    }

    @Override
    public int getArticleMun(Integer articleId) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int articleMun = mapper.getArticleMun(articleId);
        sqlSession.close();
        return articleMun;
    }

    @Override
    public int upDataInventory(Integer articleId, Integer byNum) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int i = mapper.upDataInventory(articleId, byNum);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int upDataDisable(Integer id) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int disable = mapper.upDataDisable(id);
        sqlSession.commit();
        sqlSession.close();
        return disable;
    }

    @Override
    public int updatasell(Integer articleId, Double pricr, Double discunt,Integer storage) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        int updatasell = mapper.updatasell(articleId, pricr, discunt,storage);
        sqlSession.commit();
        sqlSession.close();
        return updatasell;
    }

    @Override
    public List<Article> findArticlesLikeTitle(String title) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> articlesLikeTitle = mapper.findArticlesLikeTitle(title);
        sqlSession.close();
        return articlesLikeTitle;
    }

    @Test
    public void tq() {
        List<Article> articlesLikeTitle = findArticlesLikeTitle("欧莱雅");
        for (Article article : articlesLikeTitle) {
            System.out.println(article);
        }
    }

    @Override
    public List<Article> findArticlesLikeName(String remark) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> articlesLikeName = mapper.findArticlesLikeName(remark);
        sqlSession.close();
        return articlesLikeName;
    }

    @Override
    public List<Article> findArticlesTitleType(String title, String remark) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> articlesTitleType = mapper.findArticlesTitleType(title, remark);
        sqlSession.close();
        return articlesTitleType;
    }

    @Override
    public List<Article> findyArticleByType(String type) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleMapperDAo mapper = sqlSession.getMapper(ArticleMapperDAo.class);
        List<Article> list = mapper.findyArticleByType(type);
        sqlSession.close();
        return list;
    }

    @Test
    public void test() {
        List<Article> listArticle = getListArticle();
        for (Article article : listArticle) {
            System.out.println(article);
        }

    }
}
