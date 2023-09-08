package cn.fuchsine.dao.collect;

import cn.fuchsine.pojo.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author fuchsine
 * @date 2022/10/16 3:53
 * @since 1.0.0
 */
public interface CollectMapper {
    int addCollect(@Param("articleid") Integer articleid, @Param("userid") Integer userid);

    Collect finyCollectByMsg(@Param("articleid") Integer articleid, @Param("userid") Integer userid);
    List<Collect> getCollectByUserId(Integer userid);

    int deletecollect(@Param("articleid") Integer articleid, @Param("userid") Integer userid);

}
