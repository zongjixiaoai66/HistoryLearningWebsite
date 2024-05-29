/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t004`;
CREATE DATABASE IF NOT EXISTS `t004` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t004`;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `userid` int DEFAULT NULL COMMENT '留言用户id',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '留言用户',
  `reply_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复给',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `comment`;
INSERT INTO `comment` (`id`, `name`, `content`, `create_time`, `pid`, `userid`, `user`, `reply_user`) VALUES
	(19, '管理员的留言', 'nihao', '2023-02-28 13:49:01', NULL, 1, '管理员', NULL),
	(21, '我是王五的留言', '1111', '2023-03-04 19:09:35', NULL, 3, '我是王五', NULL),
	(22, '我是王五的留言', '1111', '2023-03-04 19:09:37', NULL, 3, '我是王五', NULL),
	(24, '我是王五的留言', '111e', '2023-03-04 20:39:19', NULL, 3, '我是王五', NULL),
	(25, '我是王五的留言', '123', '2023-03-04 22:42:06', NULL, 3, '我是王五', NULL),
	(26, '我是王五的留言', '2221', '2023-03-05 08:08:50', NULL, 3, '我是王五', NULL),
	(28, '11', '11', '2023-03-10 17:09:34', 1, 5, 'teacher1', '1'),
	(29, 'student的留言', '2222', '2023-12-05 10:50:52', NULL, 9, 'student', NULL);

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `filesize` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `fileurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `course`;
INSERT INTO `course` (`id`, `name`, `remark`, `filename`, `filesize`, `fileurl`, `md5`) VALUES
	(10, '中国历史', '历史课程', '02、我们为啥要学习版本控制工具.mp4', 12309, 'http://localhost:9999/file/5b87fb01afef411c8961e719def21ea3.mp4', 'fef94892256717b6be18005fffc4e94b'),
	(11, '战争历史', NULL, 'jspm美容院管理系统演示录像2022.mp4', 75619, 'http://localhost:9999/file/55886edc812b4ab79a1957ba0b664e73.mp4', '3945822024dd0256ccb715ea9ca7b52e'),
	(12, '美国历史', '课程', 'jspm人体健康信息管理系统演示录像2022.mp4', 58078, 'http://localhost:9999/file/abe33db3c3af48fda958223bc5af291e.mp4', 'e5a80cbfa7357cb1cb2a56c5e4865998');

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考试名称',
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教室',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '考试时间',
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '老师',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '未开始' COMMENT '考试状态',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  `duration` int DEFAULT NULL COMMENT '持续时间（分）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `exam`;
INSERT INTO `exam` (`id`, `name`, `room`, `time`, `teacher`, `state`, `course_id`, `duration`) VALUES
	(3, '中国历史考试', 'A-101', '2023-03-23 15:36', 'richard', '已结束', 10, 120);

DROP TABLE IF EXISTS `exam_appeal`;
CREATE TABLE IF NOT EXISTS `exam_appeal` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int DEFAULT NULL COMMENT '学生id',
  `examname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考试名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申诉内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `exam_appeal`;
INSERT INTO `exam_appeal` (`id`, `userid`, `examname`, `content`, `create_time`) VALUES
	(10, 9, '中国历史考试', '分数偏低', '2023-03-10 17:03:53'),
	(11, 10, '中国历史考试', '不满意', '2023-03-10 17:12:22');

DROP TABLE IF EXISTS `exam_paper`;
CREATE TABLE IF NOT EXISTS `exam_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int DEFAULT NULL COMMENT '考试id',
  `paper_id` int DEFAULT NULL COMMENT '试卷id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `exam_paper`;
INSERT INTO `exam_paper` (`id`, `exam_id`, `paper_id`) VALUES
	(13, 3, 7);

DROP TABLE IF EXISTS `finish_user_job`;
CREATE TABLE IF NOT EXISTS `finish_user_job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `jobid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `finish_user_job`;
INSERT INTO `finish_user_job` (`id`, `userid`, `jobid`) VALUES
	(4, 9, 7),
	(5, 10, 7);

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courseid` int DEFAULT NULL COMMENT '课程id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作业名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `job`;
INSERT INTO `job` (`id`, `courseid`, `name`, `create_time`) VALUES
	(7, 10, '中国历史作业', '2023-03-10 16:57:57');

DROP TABLE IF EXISTS `job_question`;
CREATE TABLE IF NOT EXISTS `job_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int DEFAULT NULL COMMENT '作业id',
  `question_id` int DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `job_question`;
INSERT INTO `job_question` (`id`, `job_id`, `question_id`) VALUES
	(131, 6, 33),
	(132, 6, 34),
	(133, 6, 35),
	(134, 6, 36),
	(135, 5, 33),
	(136, 5, 34),
	(137, 4, 33),
	(141, 7, 37);

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int DEFAULT NULL COMMENT '学生id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学习日志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `log`;
INSERT INTO `log` (`id`, `userid`, `content`, `create_time`) VALUES
	(9, 9, '111', '2023-03-10 17:02:55'),
	(10, 10, '学习了历史课程', '2023-03-10 17:08:31');

DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE IF NOT EXISTS `lunbo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `lunbo`;
INSERT INTO `lunbo` (`id`, `name`, `url`) VALUES
	(1, '111', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(2, '测试', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '课件名称',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `type` int DEFAULT NULL COMMENT '1-简单的公告，2富文本',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课件链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `notice`;
INSERT INTO `notice` (`id`, `name`, `content`, `time`, `user`, `img`, `type`, `url`) VALUES
	(14, '111', 'logo.png', '2023-03-23 16:30:50', '管理员', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 2, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(15, '数学', 'gloable.css', '2023-03-23 16:46:21', '管理员', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 2, 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `paper`;
CREATE TABLE IF NOT EXISTS `paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `score` int DEFAULT NULL COMMENT '总分',
  `duration` int DEFAULT NULL COMMENT '时长',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `paper`;
INSERT INTO `paper` (`id`, `name`, `score`, `duration`, `course_id`) VALUES
	(7, '中国历史月考', 100, 120, 10);

DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE IF NOT EXISTS `paper_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paper_id` int DEFAULT NULL COMMENT '试卷id',
  `question_id` int DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `paper_question`;
INSERT INTO `paper_question` (`id`, `paper_id`, `question_id`) VALUES
	(124, 7, 37),
	(125, 7, 38),
	(126, 7, 41);

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `type` int DEFAULT NULL COMMENT '类型：1选择，2判断，3问答',
  `a` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'a选项',
  `b` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'b选项',
  `c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'c选项',
  `d` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'd选项',
  `score` int DEFAULT NULL COMMENT '分数',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '解析',
  `user_id` int DEFAULT NULL COMMENT '出题人id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出题时间',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `question`;
INSERT INTO `question` (`id`, `name`, `type`, `a`, `b`, `c`, `d`, `score`, `answer`, `detail`, `user_id`, `time`, `course_id`) VALUES
	(37, '中国第一个皇帝', 1, '秦始皇', '隋炀帝', '唐太宗', '汉高祖', 10, 'A', '无', 5, '2023-03-10 16:50:39', 10),
	(38, '安史之乱在唐朝发生吗', 2, NULL, NULL, NULL, NULL, 10, '是', NULL, 5, '2023-03-10 16:51:26', 10),
	(39, '二战发生的时间是1940年吗', 2, NULL, NULL, NULL, NULL, 11, '否', NULL, 5, '2023-03-10 16:53:53', 11),
	(40, '第二次世界大战以下那个国家不是轴心国', 1, '英国', '德国', '日本', '意大利', 11, 'A', NULL, 5, '2023-03-10 16:55:24', 11),
	(41, '战争的本质', 3, NULL, NULL, NULL, NULL, 20, '为国争利', NULL, 5, '2023-03-10 16:55:48', 10),
	(42, '第一次世界大战是不是美国发起的', 2, NULL, NULL, NULL, NULL, 11, '否', NULL, 5, '2023-03-10 17:10:15', 11);

DROP TABLE IF EXISTS `sign`;
CREATE TABLE IF NOT EXISTS `sign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL COMMENT '考试id',
  `user_id` int NOT NULL COMMENT '学生id',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `exam_user_index` (`exam_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sign`;
INSERT INTO `sign` (`id`, `exam_id`, `user_id`, `state`) VALUES
	(28, 3, 9, '审核通过'),
	(31, 3, 10, '审核通过'),
	(32, 3, 3, '审核通过');

DROP TABLE IF EXISTS `student_paper`;
CREATE TABLE IF NOT EXISTS `student_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int DEFAULT NULL COMMENT '考试id',
  `paper` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '试卷内容',
  `user_id` int DEFAULT NULL COMMENT '学生id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提交时间',
  `score` int DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `student_paper`;
INSERT INTO `student_paper` (`id`, `exam_id`, `paper`, `user_id`, `time`, `score`) VALUES
	(7, 3, '[{"id":37,"name":"中国第一个皇帝","type":1,"a":"秦始皇","b":"隋炀帝","c":"唐太宗","d":"汉高祖","score":10,"answer":"A","detail":"无","userId":5,"courseId":10,"time":"2023-03-10 16:50:39","studentAnswer":"A"},{"id":38,"name":"安史之乱在唐朝发生吗","type":2,"a":null,"b":null,"c":null,"d":null,"score":10,"answer":"是","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:51:26","studentAnswer":"是"},{"id":41,"name":"战争的本质","type":3,"a":null,"b":null,"c":null,"d":null,"score":20,"answer":"为国争利","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:55:48","studentAnswer":"争夺利益"}]', 9, '2023-03-10 17:02:12', 40),
	(8, 3, '[{"id":37,"name":"中国第一个皇帝","type":1,"a":"秦始皇","b":"隋炀帝","c":"唐太宗","d":"汉高祖","score":10,"answer":"A","detail":"无","userId":5,"courseId":10,"time":"2023-03-10 16:50:39","studentAnswer":"B"},{"id":38,"name":"安史之乱在唐朝发生吗","type":2,"a":null,"b":null,"c":null,"d":null,"score":10,"answer":"是","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:51:26","studentAnswer":"否"},{"id":41,"name":"战争的本质","type":3,"a":null,"b":null,"c":null,"d":null,"score":20,"answer":"为国争利","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:55:48","studentAnswer":"1"}]', 10, '2023-03-10 17:12:10', 0),
	(10, 3, '[{"id":37,"name":"中国第一个皇帝","type":1,"a":"秦始皇","b":"隋炀帝","c":"唐太宗","d":"汉高祖","score":10,"answer":"A","detail":"无","userId":5,"courseId":10,"time":"2023-03-10 16:50:39","studentAnswer":"A"},{"id":38,"name":"安史之乱在唐朝发生吗","type":2,"a":null,"b":null,"c":null,"d":null,"score":10,"answer":"是","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:51:26","studentAnswer":"是"},{"id":41,"name":"战争的本质","type":3,"a":null,"b":null,"c":null,"d":null,"score":20,"answer":"为国争利","detail":null,"userId":5,"courseId":10,"time":"2023-03-10 16:55:48","studentAnswer":"123"}]', 3, '2023-03-23 15:38:55', 0);

DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_dict`;
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES
	(1, 'user', 'el-icon-user', 'icon'),
	(2, 'house', 'el-icon-house', 'icon'),
	(3, 'menu', 'el-icon-menu', 'icon'),
	(4, 's-custom', 'el-icon-s-custom', 'icon'),
	(5, 's-grid', 'el-icon-s-grid', 'icon'),
	(6, 'document', 'el-icon-document', 'icon'),
	(7, 'coffee', 'el-icon-coffee\r\n', 'icon'),
	(8, 's-marketing', 'el-icon-s-marketing', 'icon'),
	(9, 'phone-outline', 'el-icon-phone-outline', 'icon'),
	(10, 'platform-eleme', 'el-icon-platform-eleme', 'icon'),
	(11, 'eleme', 'el-icon-eleme', 'icon'),
	(12, 'delete-solid', 'el-icon-delete-solid', 'icon'),
	(13, 'delete', 'el-icon-delete', 'icon'),
	(14, 's-tools', 'el-icon-s-tools', 'icon'),
	(15, 'setting', 'el-icon-setting', 'icon'),
	(16, 'user-solid', 'el-icon-user-solid', 'icon'),
	(17, 'phone', 'el-icon-phone', 'icon'),
	(18, 'more', 'el-icon-more', 'icon'),
	(19, 'more-outline', 'el-icon-more-outline', 'icon'),
	(20, 'star-on', 'el-icon-star-on', 'icon'),
	(21, 'star-off', 'el-icon-star-off', 'icon'),
	(22, 's-goods', 'el-icon-s-goods', 'icon'),
	(23, 'goods', 'el-icon-goods', 'icon'),
	(24, 'warning', 'el-icon-warning', 'icon'),
	(25, 'warning-outline', 'el-icon-warning-outline', 'icon'),
	(26, 'question', 'el-icon-question', 'icon'),
	(27, 'info', 'el-icon-info', 'icon'),
	(28, 'remove', 'el-icon-remove', 'icon'),
	(29, 'circle-plus', 'el-icon-circle-plus', 'icon'),
	(30, 'success', 'el-icon-success', 'icon'),
	(31, 'error', 'el-icon-error', 'icon'),
	(32, 'zoom-in', 'el-icon-zoom-in', 'icon'),
	(33, 'zoom-out', 'el-icon-zoom-out', 'icon'),
	(34, 'remove-outline', 'el-icon-remove-outline', 'icon'),
	(35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon'),
	(36, 'circle-check', 'el-icon-circle-check', 'icon'),
	(37, 'circle-close', 'el-icon-circle-close', 'icon'),
	(38, 's-help', 'el-icon-s-help', 'icon'),
	(39, 'help', 'el-icon-help', 'icon'),
	(40, 'minus', 'el-icon-minus', 'icon'),
	(41, 'plus', 'el-icon-plus', 'icon'),
	(42, 'check', 'el-icon-check', 'icon'),
	(43, 'close', 'el-icon-close', 'icon'),
	(44, 'picture', 'el-icon-picture', 'icon'),
	(45, 'picture-outline', 'el-icon-picture-outline', 'icon'),
	(46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon'),
	(47, 'upload', 'el-icon-upload', 'icon'),
	(48, 'upload2', 'el-icon-upload2', 'icon'),
	(49, 'download', 'el-icon-download', 'icon'),
	(50, 'camera-solid', 'el-icon-camera-solid', 'icon'),
	(51, 'camera', 'el-icon-camera', 'icon'),
	(52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon'),
	(53, 'video-camera', 'el-icon-video-camera', 'icon'),
	(54, 'message-solid', 'el-icon-message-solid', 'icon'),
	(55, 'bell', 'el-icon-bell', 'icon'),
	(56, 's-cooperation', 'el-icon-s-cooperation', 'icon'),
	(57, 's-order', 'el-icon-s-order', 'icon'),
	(58, 's-platform', 'el-icon-s-platform', 'icon'),
	(59, 's-fold', 'el-icon-s-fold', 'icon'),
	(60, 's-unfold', 'el-icon-s-unfold', 'icon'),
	(61, 's-operation', 'el-icon-s-operation', 'icon'),
	(62, 's-promotion', 'el-icon-s-promotion', 'icon'),
	(63, 's-home', 'el-icon-s-home', 'icon'),
	(64, 's-release', 'el-icon-s-release', 'icon'),
	(65, 's-ticket', 'el-icon-s-ticket', 'icon'),
	(66, 's-management', 'el-icon-s-management', 'icon'),
	(67, 's-open', 'el-icon-s-open', 'icon'),
	(68, 's-shop', 'el-icon-s-shop', 'icon'),
	(69, 's-flag', 'el-icon-s-flag', 'icon'),
	(70, 's-comment', 'el-icon-s-comment', 'icon'),
	(71, 's-finance', 'el-icon-s-finance', 'icon'),
	(72, 's-claim', 'el-icon-s-claim', 'icon'),
	(73, 's-opportunity', 'el-icon-s-opportunity', 'icon'),
	(74, 's-data', 'el-icon-s-data', 'icon'),
	(75, 's-check', 'el-icon-s-check', 'icon'),
	(76, 'share', 'el-icon-share', 'icon'),
	(77, 'd-caret', 'el-icon-d-caret', 'icon'),
	(78, 'caret-left', 'el-icon-caret-left', 'icon'),
	(79, 'caret-right', 'el-icon-caret-right', 'icon'),
	(80, 'caret-bottom', 'el-icon-caret-bottom', 'icon'),
	(81, 'caret-top', 'el-icon-caret-top', 'icon'),
	(82, 'bottom-left', 'el-icon-bottom-left', 'icon'),
	(83, 'bottom-right', 'el-icon-bottom-right', 'icon'),
	(84, 'back', 'el-icon-back', 'icon'),
	(85, 'right', 'el-icon-right', 'icon'),
	(86, 'bottom', 'el-icon-bottom', 'icon'),
	(87, 'top', 'el-icon-top', 'icon'),
	(88, 'top-left', 'el-icon-top-left', 'icon'),
	(89, 'top-right', 'el-icon-top-right', 'icon'),
	(90, 'arrow-left', 'el-icon-arrow-left', 'icon'),
	(91, 'arrow-right', 'el-icon-arrow-right', 'icon'),
	(92, 'arrow-down', 'el-icon-arrow-down', 'icon'),
	(93, 'arrow-up', 'el-icon-arrow-up', 'icon'),
	(94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon'),
	(95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon'),
	(96, 'video-pause', 'el-icon-video-pause', 'icon'),
	(97, 'video-play', 'el-icon-video-play', 'icon'),
	(98, 'refresh', 'el-icon-refresh', 'icon'),
	(99, 'refresh-right', 'el-icon-refresh-right', 'icon'),
	(100, 'refresh-left', 'el-icon-refresh-left', 'icon'),
	(101, 'finished', 'el-icon-finished', 'icon'),
	(102, 'sort', 'el-icon-sort', 'icon'),
	(103, 'sort-up', 'el-icon-sort-up', 'icon'),
	(104, 'sort-down', 'el-icon-sort-down', 'icon'),
	(105, 'rank', 'el-icon-rank', 'icon'),
	(106, 'loading', 'el-icon-loading', 'icon'),
	(107, 'view', 'el-icon-view', 'icon'),
	(108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon'),
	(109, 'date', 'el-icon-date', 'icon'),
	(110, 'edit', 'el-icon-edit', 'icon'),
	(111, 'edit-outline', 'el-icon-edit-outline', 'icon'),
	(112, 'folder', 'el-icon-folder', 'icon'),
	(113, 'folder-opened', 'el-icon-folder-opened', 'icon'),
	(114, 'folder-add', 'el-icon-folder-add', 'icon'),
	(115, 'folder-remove', 'el-icon-folder-remove', 'icon'),
	(116, 'folder-delete', 'el-icon-folder-delete', 'icon'),
	(117, 'folder-checked', 'el-icon-folder-checked', 'icon'),
	(118, 'tickets', 'el-icon-tickets', 'icon'),
	(119, 'document-remove', 'el-icon-document-remove', 'icon'),
	(120, 'document-delete', 'el-icon-document-delete', 'icon'),
	(121, 'document-copy', 'el-icon-document-copy', 'icon'),
	(122, 'document-checked', 'el-icon-document-checked', 'icon'),
	(123, 'document-add', 'el-icon-document-add', 'icon'),
	(124, 'printer', 'el-icon-printer', 'icon'),
	(125, 'paperclip', 'el-icon-paperclip', 'icon'),
	(126, 'takeaway-box', 'el-icon-takeaway-box', 'icon'),
	(127, 'search', 'el-icon-search', 'icon'),
	(128, 'monitor', 'el-icon-monitor', 'icon'),
	(129, 'attract', 'el-icon-attract', 'icon'),
	(130, 'mobile', 'el-icon-mobile', 'icon'),
	(131, 'scissors', 'el-icon-scissors', 'icon'),
	(132, 'umbrella', 'el-icon-umbrella', 'icon'),
	(133, 'headset', 'el-icon-headset', 'icon'),
	(134, 'brush', 'el-icon-brush', 'icon'),
	(135, 'mouse', 'el-icon-mouse', 'icon'),
	(136, 'coordinate', 'el-icon-coordinate', 'icon'),
	(137, 'magic-stick', 'el-icon-magic-stick', 'icon'),
	(138, 'reading', 'el-icon-reading', 'icon'),
	(139, 'data-line', 'el-icon-data-line', 'icon'),
	(140, 'data-board', 'el-icon-data-board', 'icon'),
	(141, 'pie-chart', 'el-icon-pie-chart', 'icon'),
	(142, 'data-analysis', 'el-icon-data-analysis', 'icon'),
	(143, 'collection-tag', 'el-icon-collection-tag', 'icon'),
	(144, 'film', 'el-icon-film', 'icon'),
	(145, 'suitcase', 'el-icon-suitcase', 'icon'),
	(146, 'suitcase-1', 'el-icon-suitcase-1', 'icon'),
	(147, 'receiving', 'el-icon-receiving', 'icon'),
	(148, 'collection', 'el-icon-collection', 'icon'),
	(149, 'files', 'el-icon-files', 'icon'),
	(150, 'notebook-1', 'el-icon-notebook-1', 'icon'),
	(151, 'notebook-2', 'el-icon-notebook-2', 'icon'),
	(152, 'toilet-paper', 'el-icon-toilet-paper', 'icon'),
	(153, 'office-building', 'el-icon-office-building', 'icon'),
	(154, 'school', 'el-icon-school', 'icon'),
	(155, 'table-lamp', 'el-icon-table-lamp', 'icon'),
	(156, 'no-smoking', 'el-icon-no-smoking', 'icon'),
	(157, 'smoking', 'el-icon-smoking', 'icon'),
	(158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon'),
	(159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon'),
	(160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon'),
	(161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon'),
	(162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon'),
	(163, 'sold-out', 'el-icon-sold-out', 'icon'),
	(164, 'sell', 'el-icon-sell', 'icon'),
	(165, 'present', 'el-icon-present', 'icon'),
	(166, 'box', 'el-icon-box', 'icon'),
	(167, 'bank-card', 'el-icon-bank-card', 'icon'),
	(168, 'money', 'el-icon-money', 'icon'),
	(169, 'coin', 'el-icon-coin', 'icon'),
	(170, 'wallet', 'el-icon-wallet', 'icon'),
	(171, 'discount', 'el-icon-discount', 'icon'),
	(172, 'price-tag', 'el-icon-price-tag', 'icon'),
	(173, 'news', 'el-icon-news', 'icon'),
	(174, 'guide', 'el-icon-guide', 'icon'),
	(175, 'male', 'el-icon-male', 'icon'),
	(176, 'female', 'el-icon-female', 'icon'),
	(177, 'thumb', 'el-icon-thumb', 'icon'),
	(178, 'cpu', 'el-icon-cpu', 'icon'),
	(179, 'link', 'el-icon-link', 'icon'),
	(180, 'connection', 'el-icon-connection', 'icon'),
	(181, 'open', 'el-icon-open', 'icon'),
	(182, 'turn-off', 'el-icon-turn-off', 'icon'),
	(183, 'set-up', 'el-icon-set-up', 'icon'),
	(184, 'chat-round', 'el-icon-chat-round', 'icon'),
	(185, 'chat-line-round', 'el-icon-chat-line-round', 'icon'),
	(186, 'chat-square', 'el-icon-chat-square', 'icon'),
	(187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon'),
	(188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon'),
	(189, 'chat-line-square', 'el-icon-chat-line-square', 'icon'),
	(190, 'message', 'el-icon-message', 'icon'),
	(191, 'postcard', 'el-icon-postcard', 'icon'),
	(192, 'position', 'el-icon-position', 'icon'),
	(193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon'),
	(194, 'microphone', 'el-icon-microphone', 'icon'),
	(195, 'close-notification', 'el-icon-close-notification', 'icon'),
	(196, 'bangzhu', 'el-icon-bangzhu', 'icon'),
	(197, 'time', 'el-icon-time', 'icon'),
	(198, 'odometer', 'el-icon-odometer', 'icon'),
	(199, 'crop', 'el-icon-crop', 'icon'),
	(200, 'aim', 'el-icon-aim', 'icon'),
	(201, 'switch-button', 'el-icon-switch-button', 'icon'),
	(202, 'full-screen', 'el-icon-full-screen', 'icon'),
	(203, 'copy-document', 'el-icon-copy-document', 'icon'),
	(204, 'mic', 'el-icon-mic', 'icon'),
	(205, 'stopwatch', 'el-icon-stopwatch', 'icon'),
	(206, 'medal-1', 'el-icon-medal-1', 'icon'),
	(207, 'medal', 'el-icon-medal', 'icon'),
	(208, 'trophy', 'el-icon-trophy', 'icon'),
	(209, 'trophy-1', 'el-icon-trophy-1', 'icon'),
	(210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon'),
	(211, 'discover', 'el-icon-discover', 'icon'),
	(212, 'place', 'el-icon-place', 'icon'),
	(213, 'location', 'el-icon-location', 'icon'),
	(214, 'location-outline', 'el-icon-location-outline', 'icon'),
	(215, 'location-information', 'el-icon-location-information', 'icon'),
	(216, 'add-location', 'el-icon-add-location', 'icon'),
	(217, 'delete-location', 'el-icon-delete-location', 'icon'),
	(218, 'map-location', 'el-icon-map-location', 'icon'),
	(219, 'alarm-clock', 'el-icon-alarm-clock', 'icon'),
	(220, 'timer', 'el-icon-timer', 'icon'),
	(221, 'watch-1', 'el-icon-watch-1', 'icon'),
	(222, 'watch', 'el-icon-watch', 'icon'),
	(223, 'lock', 'el-icon-lock', 'icon'),
	(224, 'unlock', 'el-icon-unlock', 'icon'),
	(225, 'key', 'el-icon-key', 'icon'),
	(226, 'service', 'el-icon-service', 'icon'),
	(227, 'mobile-phone', 'el-icon-mobile-phone', 'icon'),
	(228, 'bicycle', 'el-icon-bicycle', 'icon'),
	(229, 'truck', 'el-icon-truck', 'icon'),
	(230, 'ship', 'el-icon-ship', 'icon'),
	(231, 'basketball', 'el-icon-basketball', 'icon'),
	(232, 'football', 'el-icon-football', 'icon'),
	(233, 'soccer', 'el-icon-soccer', 'icon'),
	(234, 'baseball', 'el-icon-baseball', 'icon'),
	(235, 'wind-power', 'el-icon-wind-power', 'icon'),
	(236, 'light-rain', 'el-icon-light-rain', 'icon'),
	(237, 'lightning', 'el-icon-lightning', 'icon'),
	(238, 'heavy-rain', 'el-icon-heavy-rain', 'icon'),
	(239, 'sunrise', 'el-icon-sunrise', 'icon'),
	(240, 'sunrise-1', 'el-icon-sunrise-1', 'icon'),
	(241, 'sunset', 'el-icon-sunset', 'icon'),
	(242, 'sunny', 'el-icon-sunny', 'icon'),
	(243, 'cloudy', 'el-icon-cloudy', 'icon'),
	(244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon'),
	(245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon'),
	(246, 'moon', 'el-icon-moon', 'icon'),
	(247, 'moon-night', 'el-icon-moon-night', 'icon'),
	(248, 'dish', 'el-icon-dish', 'icon'),
	(249, 'dish-1', 'el-icon-dish-1', 'icon'),
	(250, 'food', 'el-icon-food', 'icon'),
	(251, 'chicken', 'el-icon-chicken', 'icon'),
	(252, 'fork-spoon', 'el-icon-fork-spoon', 'icon'),
	(253, 'knife-fork', 'el-icon-knife-fork', 'icon'),
	(254, 'burger', 'el-icon-burger', 'icon'),
	(255, 'tableware', 'el-icon-tableware', 'icon'),
	(256, 'sugar', 'el-icon-sugar', 'icon'),
	(257, 'dessert', 'el-icon-dessert', 'icon'),
	(258, 'ice-cream', 'el-icon-ice-cream', 'icon'),
	(259, 'hot-water', 'el-icon-hot-water', 'icon'),
	(260, 'water-cup', 'el-icon-water-cup', 'icon'),
	(261, 'coffee-cup', 'el-icon-coffee-cup', 'icon'),
	(262, 'cold-drink', 'el-icon-cold-drink', 'icon'),
	(263, 'goblet', 'el-icon-goblet', 'icon'),
	(264, 'goblet-full', 'el-icon-goblet-full', 'icon'),
	(265, 'goblet-square', 'el-icon-goblet-square', 'icon'),
	(266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon'),
	(267, 'refrigerator', 'el-icon-refrigerator', 'icon'),
	(268, 'grape', 'el-icon-grape', 'icon'),
	(269, 'watermelon', 'el-icon-watermelon', 'icon'),
	(270, 'cherry', 'el-icon-cherry', 'icon'),
	(271, 'apple', 'el-icon-apple', 'icon'),
	(272, 'pear', 'el-icon-pear', 'icon'),
	(273, 'orange', 'el-icon-orange', 'icon'),
	(274, 'ice-tea', 'el-icon-ice-tea', 'icon'),
	(275, 'ice-drink', 'el-icon-ice-drink', 'icon'),
	(276, 'milk-tea', 'el-icon-milk-tea', 'icon'),
	(277, 'potato-strips', 'el-icon-potato-strips', 'icon'),
	(278, 'lollipop', 'el-icon-lollipop', 'icon'),
	(279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon'),
	(280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_file`;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES
	(34, '17-宠物销售系统.mp4', 'mp4', 36413, 'http://localhost:9999/file/89105825d4f14831ae645576a68e58ab.mp4', '107b697d6a2712db084d79481843b414', 0, 1),
	(35, '17-宠物销售系统.mp4', 'mp4', 36413, 'http://localhost:9999/file/89105825d4f14831ae645576a68e58ab.mp4', '107b697d6a2712db084d79481843b414', 0, 1),
	(36, '17-宠物销售系统.mp4', 'mp4', 36413, 'http://localhost:9999/file/89105825d4f14831ae645576a68e58ab.mp4', '107b697d6a2712db084d79481843b414', 0, 1),
	(37, '17-宠物销售系统.mp4', 'mp4', 36413, 'http://localhost:9999/file/89105825d4f14831ae645576a68e58ab.mp4', '107b697d6a2712db084d79481843b414', 0, 1),
	(38, 'ssm通用讲解代码视频.mp4', 'mp4', 58740, 'http://localhost:9999/file/ed41fc8dc74e430bbf03666136cc9f6f.mp4', '9da7bb7e7900d9b309bb5f200b2d896d', 0, 1),
	(39, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(40, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(41, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(42, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(43, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(44, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(45, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(46, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(47, '超市进销存管理系统.mp4', 'mp4', 17904, 'http://localhost:9999/file/b5c5a9b0c77d41ddbafebb275f17bffc.mp4', '6dc66f38ab7944535d27ade770578750', 0, 1),
	(48, 'ssm游戏美术外包管理信息系统演示录像2022.mp4', 'mp4', 68555, 'http://localhost:9999/file/1752483aa3e3462bb6b97a31a4d3d275.mp4', '0cef7f8253baeb015f3ed234c42222aa', 0, 1),
	(49, 'ssm基于微信小程序的电影院票务系统演示录像2022_3v709.mp4', 'mp4', 26564, 'http://localhost:9999/file/847fef9aa0a149e98efe9ac20f28e9cd.mp4', '5581f6507ebb2c719bdc4565802c20b2', 0, 1),
	(50, '02、我们为啥要学习版本控制工具.mp4', 'mp4', 12309, 'http://localhost:9999/file/5b87fb01afef411c8961e719def21ea3.mp4', 'fef94892256717b6be18005fffc4e94b', 0, 1),
	(51, '14-计算机考试系统设计.mp4', 'mp4', 11618, 'http://localhost:9999/file/f235dc48f1b4462b81387ea89a6c5409.mp4', 'd5fb758c99ec9468f290c6da27eb354e', 0, 1),
	(52, 'jspm美容院管理系统演示录像2022.mp4', 'mp4', 75619, 'http://localhost:9999/file/55886edc812b4ab79a1957ba0b664e73.mp4', '3945822024dd0256ccb715ea9ca7b52e', 0, 1),
	(53, 'jspm美容院管理系统演示录像2022.mp4', 'mp4', 75619, 'http://localhost:9999/file/55886edc812b4ab79a1957ba0b664e73.mp4', '3945822024dd0256ccb715ea9ca7b52e', 0, 1),
	(54, 'jspm人体健康信息管理系统演示录像2022.mp4', 'mp4', 58078, 'http://localhost:9999/file/abe33db3c3af48fda958223bc5af291e.mp4', 'e5a80cbfa7357cb1cb2a56c5e4865998', 0, 1),
	(55, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(56, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(57, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(58, 'examlogo.jpg', 'jpg', 4, 'http://localhost:8999/file/5ef17bb0c37a46f68c5b209086991222.jpg', 'f2a10b20658fa106b1035688c8c8b76a', 0, 1),
	(59, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(60, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(61, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(62, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(63, '404.png', 'png', 94, 'http://localhost:8999/file/53594294893e469b8647f523fbc94361.png', '4b1608e743bddcd3aab4274d4981a389', 0, 1),
	(64, 'logo.png', 'png', 6, 'http://localhost:8999/file/cc73c058efa44ddb9a13c9a1c2beb4fc.png', '82b9c7a5a3f405032b1db71a25f67021', 0, 1),
	(65, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(66, 'examlogo.jpg', 'jpg', 4, 'http://localhost:8999/file/5ef17bb0c37a46f68c5b209086991222.jpg', 'f2a10b20658fa106b1035688c8c8b76a', 0, 1),
	(67, 'logo.png', 'png', 6, 'http://localhost:8999/file/cc73c058efa44ddb9a13c9a1c2beb4fc.png', '82b9c7a5a3f405032b1db71a25f67021', 0, 1),
	(68, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(69, 'gloable.css', 'css', 0, 'http://localhost:8999/file/ce214d8cc7174db7ba4da4b5e472c69e.css', '5569ac5369d09ca55f5e3cec8ec6f3ab', 0, 1),
	(70, 'logo.png', 'png', 6, 'http://localhost:8999/file/cc73c058efa44ddb9a13c9a1c2beb4fc.png', '82b9c7a5a3f405032b1db71a25f67021', 0, 1),
	(71, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(72, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(73, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(74, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(75, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(76, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(77, 'logo1.png', 'png', 56, 'http://localhost:8999/file/61855ac691b34926891b4bbcc9380d7c.png', '63a09d1e5cfa0db4a878293c4302d74a', 0, 1),
	(78, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(79, '用户信息.xlsx', 'xlsx', 3, 'http://localhost:8999/file/57c06ee5afea48fc98f4715edb79b1f5.xlsx', 'ec6167ded327e6f3ecc61e54f8418bf8', 0, 1),
	(80, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(81, 'logo.png', 'png', 6, 'http://localhost:8999/file/cc73c058efa44ddb9a13c9a1c2beb4fc.png', '82b9c7a5a3f405032b1db71a25f67021', 0, 1),
	(82, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(83, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(84, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(85, 'admin.jpg', 'jpg', 122, 'http://localhost:8999/file/9eeaf5fc1b4145619a22e0c3dcdd4d96.jpg', '9653bdd4e3ee43c731e18c01f93eb9e4', 0, 1),
	(86, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(87, 'admin.jpg', 'jpg', 122, 'http://localhost:8999/file/9eeaf5fc1b4145619a22e0c3dcdd4d96.jpg', '9653bdd4e3ee43c731e18c01f93eb9e4', 0, 1),
	(88, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(89, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(90, 'admin.jpg', 'jpg', 122, 'http://localhost:8999/file/9eeaf5fc1b4145619a22e0c3dcdd4d96.jpg', '9653bdd4e3ee43c731e18c01f93eb9e4', 0, 1),
	(91, '404.png', 'png', 94, 'http://localhost:8999/file/53594294893e469b8647f523fbc94361.png', '4b1608e743bddcd3aab4274d4981a389', 0, 1),
	(92, 'registry.jpg', 'jpg', 18, 'http://localhost:8999/file/ce4b4cb3ffdb4806ae21fe34f8b57dfe.jpg', '25a1e1c54fc54d0ecb87272fcb79ad54', 0, 1),
	(93, 'logo1.png', 'png', 56, 'http://localhost:8999/file/61855ac691b34926891b4bbcc9380d7c.png', '63a09d1e5cfa0db4a878293c4302d74a', 0, 1),
	(94, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(95, 'admin.jpg', 'jpg', 122, 'http://localhost:8999/file/9eeaf5fc1b4145619a22e0c3dcdd4d96.jpg', '9653bdd4e3ee43c731e18c01f93eb9e4', 0, 1),
	(96, 'test.jpg', 'jpg', 25, 'http://localhost:8999/file/538977ea03c647999be6c268012b5927.jpg', 'f3d189893ce120a44075f98b8e8eed15', 0, 1),
	(97, 'examlogo.jpg', 'jpg', 4, 'http://localhost:8999/file/5ef17bb0c37a46f68c5b209086991222.jpg', 'f2a10b20658fa106b1035688c8c8b76a', 0, 1),
	(98, 'admin.jpg', 'jpg', 122, 'http://localhost:8999/file/9eeaf5fc1b4145619a22e0c3dcdd4d96.jpg', '9653bdd4e3ee43c731e18c01f93eb9e4', 0, 1),
	(99, 'logo1.png', 'png', 56, 'http://localhost:8999/file/61855ac691b34926891b4bbcc9380d7c.png', '63a09d1e5cfa0db4a878293c4302d74a', 0, 1),
	(100, 'gloable.css', 'css', 0, 'http://localhost:8999/file/ce214d8cc7174db7ba4da4b5e472c69e.css', '5569ac5369d09ca55f5e3cec8ec6f3ab', 0, 1);

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_menu`;
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES
	(4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300),
	(5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301),
	(6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302),
	(7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303),
	(10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0),
	(11, '题目管理', '/question', 'el-icon-menu', NULL, NULL, 'Question', 999),
	(13, '考试管理', '/exam', 'el-icon-menu', NULL, NULL, 'Exam', 999),
	(14, '试卷管理', '/paper', 'el-icon-menu', NULL, NULL, 'Paper', 999),
	(15, '报名管理', '/sign', 'el-icon-menu', NULL, NULL, 'Sign', 999),
	(16, '阅卷管理', '/studenpaper', 'el-icon-menu', NULL, NULL, 'Studenpaper', 999),
	(17, '留言管理', '/comment', 'el-icon-menu', NULL, NULL, 'Comment', 3),
	(19, '课件管理', '/notice', 'el-icon-menu', NULL, NULL, 'Notice', 111),
	(20, '日志管理', '/log', 'el-icon-menu', NULL, NULL, 'Log', 999),
	(21, '教师评价管理', '/teacherEvaluate', 'el-icon-menu', NULL, NULL, 'TeacherEvaluate', 999),
	(25, '作业管理', '/job', 'el-icon-menu', NULL, NULL, 'Job', 999),
	(28, '课程管理', '/course', 'el-icon-menu', NULL, NULL, 'Course', 999),
	(30, '轮播图管理', '/lunbo', 'el-icon-menu', NULL, NULL, 'Lunbo', 999),
	(31, '文件管理', '/file', 'el-icon-house', NULL, 4, 'File', NULL);

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_role`;
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES
	(1, '管理员', '管理员', 'ROLE_ADMIN'),
	(2, '普通用户', '学生', 'ROLE_USER'),
	(3, '教师', '教师用户', 'ROLE_TEACHER');

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

DELETE FROM `sys_role_menu`;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 10),
	(1, 19),
	(1, 21),
	(1, 30),
	(1, 31),
	(3, 10),
	(3, 11),
	(3, 13),
	(3, 14),
	(3, 15),
	(3, 16),
	(3, 17),
	(3, 19),
	(3, 20),
	(3, 25),
	(3, 28);

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `sys_user`;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES
	(1, 'admin', '123456', '管理员', 'admin@qq.com', '13988997788', '安徽合肥', '2022-01-22 13:10:27', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_ADMIN'),
	(2, 'zhang', '123456', '张张', 'zhang@qq.com', '13677889900', '南京', '2022-02-26 14:10:14', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(3, 'wang', '123456', '我是王五', 'wang@qq.com', '13877668855', '上海1', '2022-02-26 14:10:18', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(4, 'wang1', '123456', 'wang1', NULL, NULL, NULL, '2023-02-27 02:53:56', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(5, 'teacher1', '123456', 'teacher1', '111', '111', '11111', '2023-03-03 13:35:32', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_TEACHER'),
	(6, 'www', '123456', 'www', NULL, NULL, NULL, '2023-03-04 14:51:01', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(7, 'test', '123456', 'test', NULL, NULL, NULL, '2023-03-04 15:00:25', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(8, 'test1', '123456', 'test1', NULL, NULL, NULL, '2023-03-05 00:10:17', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(9, 'student', '123456', 'student', NULL, NULL, NULL, '2023-03-10 08:59:25', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER'),
	(10, 'student1', '123456', 'student1', '11', '11', '11', '2023-03-10 09:07:46', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', 'ROLE_USER');

DROP TABLE IF EXISTS `teacher_evaluate`;
CREATE TABLE IF NOT EXISTS `teacher_evaluate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentid` int DEFAULT NULL COMMENT '学生id',
  `studentname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `teachername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '评价内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '0-满意，1-不满意',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

DELETE FROM `teacher_evaluate`;
INSERT INTO `teacher_evaluate` (`id`, `studentid`, `studentname`, `teachername`, `content`, `create_time`, `grade`) VALUES
	(2, 3, 'wang', 'teacher1', '11', '2023-03-04 07:34:23', '满意'),
	(3, 5, 'teacher1', 'teacher1', 'good1', '2023-03-04 19:18:23', '不满意'),
	(4, 3, 'wang', 'teacher1', 'aa', '2023-03-04 19:34:04', '满意'),
	(5, 3, 'wang', 'teacher1', '11', '2023-03-04 22:42:53', '满意'),
	(6, 6, 'www', 'teacher1', '11', '2023-03-04 22:52:13', '满意'),
	(8, 3, 'wang', 'teacher1', '12', '2023-03-05 08:09:22', '满意'),
	(9, 3, 'wang', 'teacher1', 'verygood', '2023-03-05 08:09:34', '不满意'),
	(10, 9, 'student', 'teacher1', '满意', '2023-03-10 17:03:39', '满意'),
	(11, 10, 'student1', 'teacher1', '11', '2023-03-10 17:08:57', '满意');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
