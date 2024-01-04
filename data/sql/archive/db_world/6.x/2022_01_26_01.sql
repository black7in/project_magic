-- DB update 2022_01_26_00 -> 2022_01_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2022_01_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2022_01_26_00 2022_01_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1643215013369974869'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

-- Fixes Issue: https://github.com/azerothcore/azerothcore-wotlk/issues/7327
INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1643215013369974869');

DELETE FROM `creature` WHERE  `guid` IN ( 61226, 61227, 61228, 61229, 61230, 61231, 61232, 61233, 61234, 61235, 61236, 61237, 61238, 61239, 61240, 
61241, 61242, 61243, 61244, 61245, 61246, 61247, 61248, 61249, 61250, 61251, 61252, 61253, 61254, 61255, 61256, 61257, 61258, 61259, 61260, 61261, 
61262, 61263, 61264, 61265, 61266, 61267, 61268, 61269, 61270, 61271, 61272, 61273, 61274, 61275, 61276, 61277, 61278, 61279, 61280, 61281, 61282, 
61283, 61284, 61285, 61286, 61287, 61288, 61289, 61290, 61291, 61292, 61293, 61294, 61295, 61296, 61297, 61298, 61299, 61300, 61301, 61302, 61303, 
61304, 61305, 61306, 61307, 61308, 61309, 61310, 61312, 61313, 61314, 61315, 61316, 61317);

INSERT INTO `creature` (`guid`,`id1`,`id2`,`id3`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`ScriptName`,`VerifiedBuild`) VALUES
(61226, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3085.3767, -12614.839, 19.492636, 2.053401947021484375, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61227, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3114.931, -12621.113, 23.692553, 3.860486030578613281, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61228, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3089.3733, -12652.807, 11.980104, 0.920346319675445556, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61229, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3087.476, -12714.79, 4.8285666, 0.14057604968547821, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61230, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3067.3223, -12634.866, 10.089533, 4.250271797180175781, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61231, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3150.5469, -12711.731, 10.857615, 2.911789417266845703, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61232, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3117.0266, -12684.841, 10.53063, 4.00686502456665039, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61233, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3179.9404, -12684.104, 20.599205, 5.35120248794555664, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61234, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3116.6792, -12652.34, 18.135273, 3.476231098175048828, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61235, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3183.2344, -12651, 30.17031, 4.714342117309570312, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61236, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3086.737, -12681.325, 6.2602425, 1.812929511070251464, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61237, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3218.1824, -12684.476, 26.197147, 4.82795572280883789, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61238, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3183.059, -12720.132, 15.348929, 1.76717233657836914, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61239, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3120.7812, -12714.448, 4.5606976, 1.293659925460815429, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61240, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3148.4531, -12619.864, 32.54291, 2.032913684844970703, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61241, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3148.9258, -12683.867, 16.725727, 5.370347976684570312, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61242, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3149.7258, -12650.198, 25.944307, 5.338303089141845703, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61243, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3217.0312, -12651.569, 35.51741, 1.506338119506835937, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61244, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3214.8528, -12715.1, 25.227598, 5.93583536148071289, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61245, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3186.4922, -12751.143, 12.875109, 2.066902637481689453, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61246, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3249.981, -12718, 24.62166, 0.367395728826522827, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61247, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3246.682, -12784.12, 20.32575, 2.878346204757690429, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61248, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3282.9739, -12683.069, 23.999294, 1.704718947410583496, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61249, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3284.7183, -12750.938, 19.624697, 0.532120585441589355, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61250, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3283.3298, -12652.035, 30.252697, 5.274819850921630859, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61251, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3247.9307, -12653.201, 30.866592, 2.522988796234130859, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61252, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3248.6042, -12752.319, 23.279837, 1.001189827919006347, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61253, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3246.5105, -12681.507, 29.061234, 2.895962715148925781, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61254, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3285.8298, -12718.583, 21.425856, 3.68407440185546875, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61255, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3385.7449, -12715.757, 17.479109, 2.68819427490234375, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61256, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3351.1653, -12717.854, 17.147543, 4.127032279968261718, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61257, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3384.7056, -12747.812, 12.962563, 2.626925945281982421, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61258, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3320.3354, -12716.188, 24.402348, 3.298841476440429687, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61259, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3383.158, -12686.646, 17.665024, 1.074158787727355957, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61260, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3318.929, -12750.321, 16.73596, 3.903232574462890625, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61261, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3320.553, -12687.106, 20.46702, 5.458890914916992187, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61262, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3381.1094, -12652.545, 28.912785, 4.199787139892578125, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61263, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3385.4202, -12813.755, 13.007764, 2.13775491714477539, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61264, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3411.1362, -12779.929, 14.255584, 5.14163970947265625, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61265, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3418.1714, -12752.151, 10.181131, 4.816044807434082031, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61266, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3352.9028, -12686.875, 20.251678, 6.248052120208740234, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61267, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3348.0188, -12749.719, 14.26492, 0.948191642761230468, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61268, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3417.4426, -12716.594, 16.267937, 2.189768791198730468, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61269, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3412.6267, -12687.893, 22.139761, 5.748758792877197265, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0),
(61270, 17199, 0, 0, 530, 0, 0, 1, 1, 0, -3381.6501, -12779.417, 14.582455, 5.741998672485351562, 300, 10, 0, 1, 0, 1, 0, 0, 0, '', 0);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2022_01_26_01' WHERE sql_rev = '1643215013369974869';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
