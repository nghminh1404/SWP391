-- MySQL Script generated by MySQL Workbench
-- Sat Oct 22 14:23:18 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema swp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema swp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `swp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `swp` ;

-- -----------------------------------------------------
-- Table `swp`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NULL DEFAULT NULL,
  `full_name` VARCHAR(255) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `mobile` VARCHAR(15) NULL DEFAULT NULL,
  `password` VARCHAR(200) NULL DEFAULT NULL,
  `avatar_url` VARCHAR(500) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`subject` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `subject_code` VARCHAR(45) NULL DEFAULT NULL,
  `subject_name` VARCHAR(200) NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  `expert_id` INT NOT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `body` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  INDEX `fk_subject_user1_idx` (`manager_id` ASC) VISIBLE,
  INDEX `fk_subject_user2_idx` (`expert_id` ASC) VISIBLE,
  CONSTRAINT `fk_subject_user1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `swp`.`user` (`user_id`),
  CONSTRAINT `fk_subject_user2`
    FOREIGN KEY (`expert_id`)
    REFERENCES `swp`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`assignment` (
  `ass_id` INT NOT NULL AUTO_INCREMENT,
  `subject_id` INT NOT NULL,
  `title` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `eval_weight` VARCHAR(50) NULL DEFAULT NULL,
  `is_team_work` BIT(1) NULL DEFAULT NULL,
  `is_ongoing` BIT(1) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ass_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `assignment_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `swp`.`subject` (`subject_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`setting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`setting` (
  `setting_id` INT NOT NULL AUTO_INCREMENT,
  `type_id` INT NOT NULL,
  `setting_title` VARCHAR(200) NULL DEFAULT NULL,
  `setting_value` VARCHAR(45) NULL DEFAULT NULL,
  `display_order` INT NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE INDEX `type_id` (`type_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`class` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `subject_id` INT NOT NULL,
  `class_code` VARCHAR(45) NULL DEFAULT NULL,
  `trainer_id` INT NOT NULL,
  `supporter_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  INDEX `term_id` (`term_id` ASC) VISIBLE,
  INDEX `supporter_id` (`supporter_id` ASC) VISIBLE,
  INDEX `trainer_id` (`trainer_id` ASC) VISIBLE,
  CONSTRAINT `class_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `swp`.`subject` (`subject_id`),
  CONSTRAINT `class_ibfk_2`
    FOREIGN KEY (`term_id`)
    REFERENCES `swp`.`setting` (`setting_id`),
  CONSTRAINT `class_ibfk_3`
    FOREIGN KEY (`supporter_id`)
    REFERENCES `swp`.`user` (`user_id`),
  CONSTRAINT `class_ibfk_4`
    FOREIGN KEY (`trainer_id`)
    REFERENCES `swp`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`schedule` (
  `schedule_id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `slot_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `training_date` DATE NULL DEFAULT NULL,
  `from_time` TIME NULL DEFAULT NULL,
  `to_time` TIME NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  CONSTRAINT `schedule_ibfk_1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`attendance` (
  `class_id` INT NOT NULL,
  `trainee_id` INT NOT NULL,
  `schedule_id` INT NOT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `comment` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`, `trainee_id`, `schedule_id`),
  INDEX `trainee_id` (`trainee_id` ASC) VISIBLE,
  INDEX `schedule_id` (`schedule_id` ASC) VISIBLE,
  CONSTRAINT `attendance_ibfk_1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`),
  CONSTRAINT `attendance_ibfk_2`
    FOREIGN KEY (`trainee_id`)
    REFERENCES `swp`.`user` (`user_id`),
  CONSTRAINT `attendance_ibfk_3`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `swp`.`schedule` (`schedule_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`class_setting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`class_setting` (
  `setting_id` INT NOT NULL AUTO_INCREMENT,
  `type_id` INT NULL DEFAULT NULL,
  `setting_title` VARCHAR(45) NULL DEFAULT NULL,
  `setting_value` VARCHAR(45) NULL DEFAULT NULL,
  `display_order` VARCHAR(45) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`setting_id`),
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  INDEX `type_id` (`type_id` ASC) VISIBLE,
  CONSTRAINT `class_setting_ibfk_1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`),
  CONSTRAINT `class_setting_ibfk_2`
    FOREIGN KEY (`type_id`)
    REFERENCES `swp`.`setting` (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`class_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`class_user` (
  `class_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `note` VARCHAR(500) NULL DEFAULT NULL,
  `dropout_date` DATE NULL DEFAULT NULL,
  `ongoing_eval` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `final_eval` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `topic_eval` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`, `user_id`),
  INDEX `fk_class_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_class_has_user_class1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_has_user_class1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`),
  CONSTRAINT `fk_class_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `swp`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`milestone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`milestone` (
  `milestone_id` INT NOT NULL AUTO_INCREMENT,
  `ass_id` INT NULL DEFAULT NULL,
  `class_id` INT NOT NULL,
  `from_date` DATE NULL DEFAULT NULL,
  `to_date` DATE NULL DEFAULT NULL,
  `title` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  INDEX `ass_id` (`ass_id` ASC) VISIBLE,
  CONSTRAINT `milestone_ibfk_1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`),
  CONSTRAINT `milestone_ibfk_2`
    FOREIGN KEY (`ass_id`)
    REFERENCES `swp`.`assignment` (`ass_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`eval_criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`eval_criteria` (
  `criteria_id` INT NOT NULL AUTO_INCREMENT,
  `ass_id` INT NOT NULL,
  `milestone_id` INT NOT NULL,
  `criteria_name` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `is_team_eval` BIT(1) NULL DEFAULT NULL,
  `eval_weight` VARCHAR(50) NULL DEFAULT NULL,
  `max_loc` INT NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`criteria_id`),
  INDEX `ass_id` (`ass_id` ASC) VISIBLE,
  INDEX `milestone_id` (`milestone_id` ASC) VISIBLE,
  CONSTRAINT `eval_criteria_ibfk_1`
    FOREIGN KEY (`ass_id`)
    REFERENCES `swp`.`assignment` (`ass_id`),
  CONSTRAINT `eval_criteria_ibfk_2`
    FOREIGN KEY (`milestone_id`)
    REFERENCES `swp`.`milestone` (`milestone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`team` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `team_code` VARCHAR(50) NULL DEFAULT NULL,
  `topic_name` VARCHAR(200) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  INDEX `fk_team_class1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_team_class1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`issue` (
  `issue_id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `assignee_id` INT NOT NULL,
  `plan_mst_id` INT NOT NULL,
  `actual_mst_id` INT NOT NULL,
  `title` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `type_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `linked_issue_ids` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `is_closed` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  INDEX `team_id` (`team_id` ASC) VISIBLE,
  CONSTRAINT `issue_ibfk_1`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class` (`class_id`),
  CONSTRAINT `issue_ibfk_2`
    FOREIGN KEY (`team_id`)
    REFERENCES `swp`.`team` (`team_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`submit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`submit` (
  `submit_id` INT NOT NULL AUTO_INCREMENT,
  `milestone_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `submit_file_url` VARCHAR(100) NULL DEFAULT NULL,
  `submit_time` TIME NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`submit_id`),
  INDEX `milestone_id` (`milestone_id` ASC) VISIBLE,
  INDEX `team_id` (`team_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  CONSTRAINT `submit_ibfk_1`
    FOREIGN KEY (`milestone_id`)
    REFERENCES `swp`.`milestone` (`milestone_id`),
  CONSTRAINT `submit_ibfk_2`
    FOREIGN KEY (`team_id`)
    REFERENCES `swp`.`team` (`team_id`),
  CONSTRAINT `submit_ibfk_3`
    FOREIGN KEY (`user_id`)
    REFERENCES `swp`.`class_user` (`user_id`),
  CONSTRAINT `submit_ibfk_4`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class_user` (`class_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`tracking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`tracking` (
  `tracking_id` INT NOT NULL AUTO_INCREMENT,
  `milestone_id` INT NOT NULL,
  `issue_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `assignee_id` INT NOT NULL,
  `submit_id` INT NOT NULL,
  `change_log` VARCHAR(100) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`tracking_id`),
  INDEX `milestone_id` (`milestone_id` ASC) VISIBLE,
  INDEX `issue_id` (`issue_id` ASC) VISIBLE,
  INDEX `submit_id` (`submit_id` ASC) VISIBLE,
  CONSTRAINT `tracking_ibfk_1`
    FOREIGN KEY (`milestone_id`)
    REFERENCES `swp`.`milestone` (`milestone_id`),
  CONSTRAINT `tracking_ibfk_2`
    FOREIGN KEY (`issue_id`)
    REFERENCES `swp`.`issue` (`issue_id`),
  CONSTRAINT `tracking_ibfk_3`
    FOREIGN KEY (`submit_id`)
    REFERENCES `swp`.`submit` (`submit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`loc_eval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`loc_eval` (
  `loc_eval_id` INT NOT NULL AUTO_INCREMENT,
  `complexity_id` INT NOT NULL,
  `quality_id` INT NOT NULL,
  `converted_loc` VARCHAR(100) NULL DEFAULT NULL,
  `is_late_submit` BIT(1) NULL DEFAULT NULL,
  `comment` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `new_milestone_id` INT NOT NULL,
  `new_complexity` INT NOT NULL,
  PRIMARY KEY (`loc_eval_id`),
  INDEX `new_milestone_id` (`new_milestone_id` ASC) VISIBLE,
  CONSTRAINT `loc_eval_ibfk_1`
    FOREIGN KEY (`new_milestone_id`)
    REFERENCES `swp`.`tracking` (`milestone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`milestone_eval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`milestone_eval` (
  `evaluation_id` INT NOT NULL AUTO_INCREMENT,
  `milestone_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  `bonus` INT NULL DEFAULT NULL,
  `grade` DOUBLE NULL DEFAULT NULL,
  `comment` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `submit_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`evaluation_id`),
  INDEX `milestone_id` (`milestone_id` ASC) VISIBLE,
  INDEX `class_id` (`class_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `submit_id` (`submit_id` ASC) VISIBLE,
  CONSTRAINT `milestone_eval_ibfk_1`
    FOREIGN KEY (`milestone_id`)
    REFERENCES `swp`.`submit` (`milestone_id`),
  CONSTRAINT `milestone_eval_ibfk_2`
    FOREIGN KEY (`class_id`)
    REFERENCES `swp`.`class_user` (`class_id`),
  CONSTRAINT `milestone_eval_ibfk_3`
    FOREIGN KEY (`user_id`)
    REFERENCES `swp`.`class_user` (`user_id`),
  CONSTRAINT `milestone_eval_ibfk_4`
    FOREIGN KEY (`submit_id`)
    REFERENCES `swp`.`submit` (`submit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`member_eval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`member_eval` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evaluation_id` INT NOT NULL,
  `criteria_id` INT NOT NULL,
  `total_loc` INT NULL DEFAULT NULL,
  `grade` DOUBLE NULL DEFAULT NULL,
  `comment` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `criteria_id` (`criteria_id` ASC) VISIBLE,
  INDEX `evaluation_id` (`evaluation_id` ASC) VISIBLE,
  CONSTRAINT `member_eval_ibfk_1`
    FOREIGN KEY (`criteria_id`)
    REFERENCES `swp`.`eval_criteria` (`criteria_id`),
  CONSTRAINT `member_eval_ibfk_2`
    FOREIGN KEY (`evaluation_id`)
    REFERENCES `swp`.`milestone_eval` (`evaluation_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`permission` (
  `screen_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `get_all_data` BIT(1) NULL DEFAULT NULL,
  `can_delete` BIT(1) NULL DEFAULT NULL,
  `can_add` BIT(1) NULL DEFAULT NULL,
  `can_edit` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`screen_id`, `role_id`),
  INDEX `role_id` (`role_id` ASC) VISIBLE,
  CONSTRAINT `permission_ibfk_1`
    FOREIGN KEY (`screen_id`)
    REFERENCES `swp`.`setting` (`setting_id`),
  CONSTRAINT `permission_ibfk_2`
    FOREIGN KEY (`role_id`)
    REFERENCES `swp`.`setting` (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`subject_setting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`subject_setting` (
  `setting_id` INT NOT NULL AUTO_INCREMENT,
  `subject_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `setting_title` VARCHAR(45) NULL DEFAULT NULL,
  `setting_value` VARCHAR(45) NULL DEFAULT NULL,
  `display_order` VARCHAR(45) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  INDEX `subject_id` (`subject_id` ASC) VISIBLE,
  INDEX `type_id` (`type_id` ASC) VISIBLE,
  CONSTRAINT `subject_setting_ibfk_1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `swp`.`subject` (`subject_id`),
  CONSTRAINT `subject_setting_ibfk_2`
    FOREIGN KEY (`type_id`)
    REFERENCES `swp`.`setting` (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`team_eval`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`team_eval` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `criteria_id` INT NOT NULL,
  `submit_id` INT NOT NULL,
  `grade` INT NULL DEFAULT NULL,
  `comment` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `criteria_id` (`criteria_id` ASC) VISIBLE,
  INDEX `submit_id` (`submit_id` ASC) VISIBLE,
  CONSTRAINT `team_eval_ibfk_1`
    FOREIGN KEY (`criteria_id`)
    REFERENCES `swp`.`eval_criteria` (`criteria_id`),
  CONSTRAINT `team_eval_ibfk_2`
    FOREIGN KEY (`submit_id`)
    REFERENCES `swp`.`submit` (`submit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`team_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`team_member` (
  `team_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `is_leader` BIT(1) NULL DEFAULT NULL,
  `is_active` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`team_id`, `user_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `team_member_ibfk_1`
    FOREIGN KEY (`team_id`)
    REFERENCES `swp`.`team` (`team_id`),
  CONSTRAINT `team_member_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `swp`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`update_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`update_history` (
  `update_history_id` INT NOT NULL AUTO_INCREMENT,
  `tracking_id` INT NOT NULL,
  `milestone_id` INT NOT NULL,
  `update_date` DATE NULL DEFAULT NULL,
  `update_title` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`update_history_id`),
  INDEX `tracking_id` (`tracking_id` ASC) VISIBLE,
  INDEX `milestone_id` (`milestone_id` ASC) VISIBLE,
  CONSTRAINT `update_history_ibfk_1`
    FOREIGN KEY (`tracking_id`)
    REFERENCES `swp`.`tracking` (`tracking_id`),
  CONSTRAINT `update_history_ibfk_2`
    FOREIGN KEY (`milestone_id`)
    REFERENCES `swp`.`milestone` (`milestone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`user_role` (
  `user_id` INT NOT NULL,
  `setting_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `setting_id`),
  INDEX `fk_user_has_setting_setting1_idx` (`setting_id` ASC) VISIBLE,
  INDEX `fk_user_has_setting_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_setting_setting1`
    FOREIGN KEY (`setting_id`)
    REFERENCES `swp`.`setting` (`setting_id`),
  CONSTRAINT `fk_user_has_setting_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `swp`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swp`.`web_contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swp`.`web_contact` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NULL DEFAULT NULL,
  `supporter_id` INT NULL DEFAULT NULL,
  `full_name` VARCHAR(200) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `mobile` VARCHAR(45) NULL DEFAULT NULL,
  `message` VARCHAR(500) NULL DEFAULT NULL,
  `response` VARCHAR(500) NULL DEFAULT NULL,
  `status` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
