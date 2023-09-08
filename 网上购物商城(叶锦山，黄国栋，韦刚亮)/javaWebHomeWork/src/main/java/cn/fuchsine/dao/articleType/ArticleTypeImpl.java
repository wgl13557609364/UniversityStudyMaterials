package cn.fuchsine.dao.articleType;

import cn.fuchsine.pojo.ArticleType;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author fuchsine
 * @date 2022/9/30 17:18
 * @since 1.0.0
 */
public class ArticleTypeImpl implements ArticleTypMapper{

    @Override
    public List<ArticleType> getListArticleType() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleTypMapper mapper = sqlSession.getMapper(ArticleTypMapper.class);
        List<ArticleType> listArticleType = mapper.getListArticleType();
        sqlSession.close();
        ArrayList<ArticleType> typelist = new ArrayList<>();
        for (ArticleType articleType : listArticleType) {
            if(articleType.getCode().length()==4){
                typelist.add(articleType);
            }
        }
        return typelist;
    }

    @Override
    public ArticleType findyByremark(String remark) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        ArticleTypMapper mapper = sqlSession.getMapper(ArticleTypMapper.class);
        ArticleType articleType = mapper.findyByremark(remark);
        sqlSession.close();
        return articleType;
    }

    @Test
    public void test(){
        ArticleType articleType = findyByremark("护肤");
        System.out.println(articleType.getCode());
    }
}
