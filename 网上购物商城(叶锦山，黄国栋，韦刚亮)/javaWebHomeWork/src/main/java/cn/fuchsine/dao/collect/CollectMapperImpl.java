package cn.fuchsine.dao.collect;

import cn.fuchsine.pojo.Collect;
import cn.fuchsine.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/16 3:58
 * @since 1.0.0
 */
public class CollectMapperImpl implements CollectMapper{
    @Override
    public int addCollect(Integer articleid, Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CollectMapper mapper = sqlSession.getMapper(CollectMapper.class);
        int i = mapper.addCollect(articleid, userid);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public Collect finyCollectByMsg(Integer articleid, Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CollectMapper mapper = sqlSession.getMapper(CollectMapper.class);
        Collect collect = mapper.finyCollectByMsg(articleid, userid);
        sqlSession.close();
        return collect;
    }

    @Override
    public List<Collect> getCollectByUserId(Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CollectMapper mapper = sqlSession.getMapper(CollectMapper.class);
        List<Collect> collectList = mapper.getCollectByUserId(userid);
        sqlSession.close();
        return collectList;
    }

    @Override
    public int deletecollect(Integer articleid, Integer userid) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        CollectMapper mapper = sqlSession.getMapper(CollectMapper.class);
        int deletecollect = mapper.deletecollect(articleid, userid);
        sqlSession.commit();
        sqlSession.close();
        return deletecollect;
    }

    @Test
    public void e(){
        int deletecollect = deletecollect(6, 1);
        System.out.println(deletecollect);
    }
}
