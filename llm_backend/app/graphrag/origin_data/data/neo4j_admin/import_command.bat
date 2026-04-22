@echo off

REM Neo4j Admin导入命令
REM 适用于Neo4j 2025.02.0及更高版本
REM 生成时间: 2026-04-06 19:56:26

neo4j-admin database import full neo4j --overwrite-destination ^
  --nodes=Product="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\product_nodes.csv" ^
  --nodes=Category="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\category_nodes.csv" ^
  --nodes=Supplier="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\supplier_nodes.csv" ^
  --nodes=Customer="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\customer_nodes.csv" ^
  --nodes=Employee="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\employee_nodes.csv" ^
  --nodes=Shipper="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\shipper_nodes.csv" ^
  --nodes=Order="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\order_nodes.csv" ^
  --nodes=Review="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\review_nodes.csv" ^
  --relationships=BELONGS_TO="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\product_category_edges.csv" ^
  --relationships=SUPPLIED_BY="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\product_supplier_edges.csv" ^
  --relationships=PLACED="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\customer_order_edges.csv" ^
  --relationships=PROCESSED="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\employee_order_edges.csv" ^
  --relationships=SHIPPED_VIA="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\order_shipper_edges.csv" ^
  --relationships=CONTAINS="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\order_product_edges.csv" ^
  --relationships=REPORTS_TO="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\employee_reports_to_edges.csv" ^
  --relationships=WROTE="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\customer_review_edges.csv" ^
  --relationships=ABOUT="E:\shixi\IntelligentCustomerServiceProject\llm_backend\app\graphrag\origin_data\data\neo4j_admin\review_product_edges.csv" ^
  --delimiter="," ^
  --array-delimiter=";" ^
  --skip-bad-relationships=true ^
  --skip-duplicate-nodes=true
