-- DB update 2021_06_22_00 -> 2021_06_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_characters' AND COLUMN_NAME = '2021_06_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_characters CHANGE COLUMN 2021_06_22_00 2021_06_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_characters WHERE sql_rev = '1621780938723425400'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_characters` (`sql_rev`) VALUES ('1621780938723425400');

ALTER TABLE `mail` 
ADD COLUMN `auctionId` INT DEFAULT 0 NOT NULL AFTER `checked`; 

--
-- END UPDATING QUERIES
--
UPDATE version_db_characters SET date = '2021_06_23_00' WHERE sql_rev = '1621780938723425400';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
