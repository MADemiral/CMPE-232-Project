-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project_232
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `visitor_visit_prisoner_view`
--

DROP TABLE IF EXISTS `visitor_visit_prisoner_view`;
/*!50001 DROP VIEW IF EXISTS `visitor_visit_prisoner_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visitor_visit_prisoner_view` AS SELECT 
 1 AS `visitor_ssn`,
 1 AS `visitor_name`,
 1 AS `visitor_surname`,
 1 AS `prisoner_ssn`,
 1 AS `prisoner_name`,
 1 AS `prisoner_surname`,
 1 AS `visit_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `prisoner_view`
--

DROP TABLE IF EXISTS `prisoner_view`;
/*!50001 DROP VIEW IF EXISTS `prisoner_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prisoner_view` AS SELECT 
 1 AS `prisoner_ssn`,
 1 AS `prisoner_name`,
 1 AS `prisoner_surname`,
 1 AS `sentence_id`,
 1 AS `sentence_name`,
 1 AS `block_id`,
 1 AS `block_name`,
 1 AS `stay_start_date`,
 1 AS `stay_end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_view`
--

DROP TABLE IF EXISTS `employee_view`;
/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_view` AS SELECT 
 1 AS `emp_ssn`,
 1 AS `emp_name`,
 1 AS `emp_surname`,
 1 AS `emp_zip`,
 1 AS `emp_city`,
 1 AS `emp_phone_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_compound_view`
--

DROP TABLE IF EXISTS `employee_compound_view`;
/*!50001 DROP VIEW IF EXISTS `employee_compound_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_compound_view` AS SELECT 
 1 AS `emp_ssn`,
 1 AS `emp_name`,
 1 AS `emp_surname`,
 1 AS `emp_zip`,
 1 AS `emp_city`,
 1 AS `emp_phone_no`,
 1 AS `guarding_block`,
 1 AS `guard_start_date`,
 1 AS `guard_end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `visitor_view`
--

DROP TABLE IF EXISTS `visitor_view`;
/*!50001 DROP VIEW IF EXISTS `visitor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visitor_view` AS SELECT 
 1 AS `v_ssn`,
 1 AS `v_name`,
 1 AS `v_surname`,
 1 AS `v_phone_no`,
 1 AS `v_zip`,
 1 AS `v_city`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `visitor_visit_prisoner_view`
--

/*!50001 DROP VIEW IF EXISTS `visitor_visit_prisoner_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visitor_visit_prisoner_view` AS select `v`.`v_ssn` AS `visitor_ssn`,`v`.`v_name` AS `visitor_name`,`v`.`v_surname` AS `visitor_surname`,`vi`.`prisoner_ssn` AS `prisoner_ssn`,`p`.`p_name` AS `prisoner_name`,`p`.`p_surname` AS `prisoner_surname`,`vi`.`visit_date` AS `visit_date` from ((`visitors` `v` join `visits` `vi` on((`v`.`v_ssn` = `vi`.`visitor_ssn`))) join `prisoners` `p` on((`vi`.`prisoner_ssn` = `p`.`p_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prisoner_view`
--

/*!50001 DROP VIEW IF EXISTS `prisoner_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prisoner_view` AS select `p`.`p_ssn` AS `prisoner_ssn`,`p`.`p_name` AS `prisoner_name`,`p`.`p_surname` AS `prisoner_surname`,`j`.`sentence_id` AS `sentence_id`,`s`.`sentence_name` AS `sentence_name`,`st`.`block_id` AS `block_id`,`b`.`block_name` AS `block_name`,`st`.`stay_start_date` AS `stay_start_date`,`st`.`stay_end_date` AS `stay_end_date` from ((((`prisoners` `p` join `be_judged` `j` on((`p`.`p_ssn` = `j`.`prisoner_ssn`))) join `sentences` `s` on((`j`.`sentence_id` = `s`.`sentence_id`))) join `stays` `st` on((`p`.`p_ssn` = `st`.`prisoner_ssn`))) join `blocks` `b` on((`st`.`block_id` = `b`.`block_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_view` AS select `e`.`emp_ssn` AS `emp_ssn`,`e`.`emp_name` AS `emp_name`,`e`.`emp_surname` AS `emp_surname`,`a`.`emp_zip` AS `emp_zip`,`a`.`emp_city` AS `emp_city`,`p`.`emp_phone_no` AS `emp_phone_no` from ((`employees` `e` join `emp_address` `a` on((`e`.`emp_ssn` = `a`.`emp_ssn`))) join `emp_phone_no` `p` on((`e`.`emp_ssn` = `p`.`emp_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_compound_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_compound_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_compound_view` AS select `e`.`emp_ssn` AS `emp_ssn`,`e`.`emp_name` AS `emp_name`,`e`.`emp_surname` AS `emp_surname`,`a`.`emp_zip` AS `emp_zip`,`a`.`emp_city` AS `emp_city`,`p`.`emp_phone_no` AS `emp_phone_no`,`g`.`block_id` AS `guarding_block`,`g`.`guard_start_date` AS `guard_start_date`,`g`.`guard_end_date` AS `guard_end_date` from (((`employees` `e` join `emp_address` `a` on((`e`.`emp_ssn` = `a`.`emp_ssn`))) join `emp_phone_no` `p` on((`e`.`emp_ssn` = `p`.`emp_ssn`))) left join `guards` `g` on((`e`.`emp_ssn` = `g`.`emp_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visitor_view`
--

/*!50001 DROP VIEW IF EXISTS `visitor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visitor_view` AS select `visitors`.`v_ssn` AS `v_ssn`,`visitors`.`v_name` AS `v_name`,`visitors`.`v_surname` AS `v_surname`,`v_phone_no`.`v_phone_no` AS `v_phone_no`,`v_address`.`v_zip` AS `v_zip`,`v_address`.`v_city` AS `v_city` from ((`visitors` left join `v_phone_no` on((`visitors`.`v_ssn` = `v_phone_no`.`v_ssn`))) left join `v_address` on((`visitors`.`v_ssn` = `v_address`.`v_ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08 19:11:59
