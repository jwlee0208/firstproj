ALTER TABLE test.tb_player_info add FOREIGN KEY (user_id) REFERENCES test.tb_user(user_id);


ALTER TABLE test.tb_attr_elem add FOREIGN KEY (attr_id) REFERENCES test.tb_attr(attr_id);


ALTER TABLE test.tb_attr_elem_map add FOREIGN KEY (attr_elem_id) REFERENCES test.tb_attr_elem(attr_elem_id);


ALTER TABLE `test`.`TB_USER` ADD COLUMN `nationality` VARCHAR(30) NULL AFTER `phone_no`, ADD COLUMN `language` CHAR(2) NULL AFTER `nationality`;