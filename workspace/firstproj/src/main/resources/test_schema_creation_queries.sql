-- tb_board  table creation
CREATE TABLE `TB_BOARD` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_name` varchar(45) DEFAULT NULL,
  `board_type` char(1) CHARACTER SET latin1 DEFAULT NULL COMMENT '0 : 기본 게시판, 1: 이미지 게시판',
  `create_user_id` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `create_user_name` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_user_id` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `modify_user_name` varchar(45) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- tb_board_article table creation
CREATE TABLE `TB_BOARD_ARTICLE` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시글 아이디',
  `board_id` int(11) DEFAULT NULL COMMENT '게시판 아이디',
  `title` varchar(45) DEFAULT NULL COMMENT '게시글 제목\n',
  `content` text COMMENT '게시글 내용\n',
  `file_path` varchar(200) DEFAULT NULL COMMENT '썸네일 파일 경로\n',
  `original_file_name` varchar(100) DEFAULT NULL COMMENT '썸네일 파일 명',
  `author_id` varchar(45) DEFAULT NULL COMMENT '작성자 아이디',
  `author_nm` varchar(45) DEFAULT NULL COMMENT '작성자 이름',
  `create_date` datetime DEFAULT NULL COMMENT '작성 일자',
  `status` int(1) DEFAULT '1' COMMENT '게시글 상태값(0 : 삭제, 1 : 저장, 2 : 임시저장) ',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- tb_user table creation
CREATE TABLE `TB_USER` (
  `user_id` varchar(50) NOT NULL,
  `user_nm` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- tb_prohibited_word table creation
CREATE TABLE `TB_PROHIBITED_WORD` (
  `prohibited_word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '금칙어 아이디',
  `prohibited_word_str` varchar(100) DEFAULT NULL COMMENT '''금칙어''',
  `create_user_id` varchar(45) DEFAULT NULL COMMENT '''금칙어 생성자 아이디''',
  `create_user_nm` varchar(45) DEFAULT NULL COMMENT '''금칙어 생성자 명''',
  `create_date` datetime DEFAULT NULL COMMENT '금칙어 생성 일자',
  PRIMARY KEY (`prohibited_word_id`),
  UNIQUE KEY `prohibited_word_id_UNIQUE` (`prohibited_word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='금칙어 관리';
