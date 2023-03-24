CREATE TABLE user_table
(
    user_id VARCHAR2(200),
    user_pwd VARCHAR2(200),
    user_name VARCHAR2(200),
    user_phone VARCHAR2(200),
    user_address1 VARCHAR2(200),
    user_address2 VARCHAR2(200),
    user_address3 VARCHAR2(200),
    user_email VARCHAR2(200),
    user_birthday DATE,
    user_gender VARCHAR2(200),
    user_nickname VARCHAR2(200),
    email_check VARCHAR2(20) DEFAULT 1,
    user_role NUMBER(2) DEFAULT 0,
    user_grade NUMBER(2) DEFAULT 0,
    user_totpurchase NUMBER(10) DEFAULT 0,
    user_point NUMBER(10) DEFAULT 0,
    user_insertdate DATE DEFAULT SYSDATE
    
);

CREATE TABLE seller_table
(
    seller_id VARCHAR2(200),
    seller_pw VARCHAR2(200),
    seller_name VARCHAR2(200),
    seller_phone VARCHAR2(200),
    seller_jumin VARCHAR2(200),
    seller_email VARCHAR2(200),
    user_role NUMBER(2) DEFAULT 0,
    business_license VARCHAR2(200),
    business_address1 VARCHAR2(200),
    business_address1 VARCHAR2(200),
    business_address1 VARCHAR2(200)
    
);

CREATE TABLE survey_table
(
    no1 NUMBER(2),no2 NUMBER(2),no3 NUMBER(2),
    no4 NUMBER(2),no5 NUMBER(2),no6 NUMBER(2),
    no7 NUMBER(2),no8 NUMBER(2),no9 NUMBER(2),
    no10 NUMBER(2),no11 NUMBER(2),no12 NUMBER(2),
    no13 NUMBER(2),no14 NUMBER(2),no15 NUMBER(2),
    no16 NUMBER(2),no17 NUMBER(2),no18 NUMBER(2),
    no19 NUMBER(2),no20 NUMBER(2)
);

CREATE TABLE store_table
(
    store_snum NUMBER,
    seller_id VARCHAR2(200),
    store_sname VARCHAR2(200),
    store_product_count NUMBER(10),
    store_sellcount NUMBER(10),
    store_sales NUMBER(10)
);
CREATE TABLE coupon_table
(
    coupon_num NUMBER(10),
    user_id VARCHAR2(200),
    coupon_name VARCHAR2(200),
    coupon_discount NUMBER(10)
);

CREATE TABLE product_table
(
    product_num NUMBER(10),
    category_num VARCHAR2(200),
    product_name VARCHAR2(200),
    product_price NUMBER(10),
    product_stock NUMBER(10),
    product_desc VARCHAR2(2000),
    product_hits NUMBER(10),
    product_like NUMBER(10),
    product_date DATE,
    product_grade NUMBER(10),
    product_sale NUMBER(10),
    product_sellcount NUMBER(10),
    product_origin VARCHAR2(200),
    product_exp DATE
);

CREATE TABLE cart_table
(
    product_num NUMBER(10),
    user_id VARCHAR2(200),
    product_count NUMBER(10),
    product_check NUMBER(2)
);

CREATE TABLE user_order_table
(
    order_num NUMBER(10),
    product_num NUMBER(10),
    product_count NUMBER(10),
    user_id VARCHAR2(200),
    order_date DATE,
    order_address1 VARCHAR2(200),
    order_address2 VARCHAR2(200),
    order_address3 VARCHAR2(200),
    receiver_name VARCHAR2(200),
    receiver_phone VARCHAR2(200),
    receiver_request VARCHAR2(200),
    order_pricetot NUMBER(10),
    order_sale NUMBER(10),
    order_coupon NUMBER(10),
    order_point NUMBER(10),
    order_deliverycharge NUMBER(10),
    order_finalprice NUMBER(10),
    order_paysection NUMBER(10),
    order_paycard VARCHAR2(200),
    order_paypw NUMBER(10)
);
CREATE TABLE product_category_table
(
    category_num NUMBER(10),
    category_main VARCHAR2(200),
    category_detail VARCHAR2(200)
);

CREATE TABLE userorder_detail_table
(
    order_detail_num NUMBER(10),
    order_num NUMBER(10),
    product_num NUMBER(10),
    product_count NUMBER(10)
);
CREATE TABLE delivery_table
(
    order_detail_num NUMBER(10),
    order_num NUMBER(10),
    order_status NUMBER(2),
    order_time NUMBER(3)
);
CREATE TABLE userorder_refund_table
(
    refund_num NUMBER(10),
    order_detail_num NUMBER(10),
    refund_img VARCHAR2(200),
    refund_reason VARCHAR2(200),
    user_email VARCHAR2(200)
);
CREATE TABLE product_thumb_imagefile_table
(
    file_num NUMBER(10),
    product_num NUMBER(10),
    orgin_file_name VARCHAR2(200),
    stored_file_name VARCHAR2(200),
    stored_order NUMBER(10),
    file_size NUMBER(10)
);
CREATE TABLE product_detail_imagefile_table
(
    file_num NUMBER(10),
    product_num NUMBER(10),
    orgin_file_name VARCHAR2(200),
    stored_file_name VARCHAR2(200),
    stored_order NUMBER(10),
    file_size NUMBER(10)
);
CREATE TABLE product_reply_table
(
    reply_num NUMBER(10),
    product_num NUMBER(10),
    user_id VARCHAR2(200),
    reply_content VARCHAR2(2000),
    reporting_date DATE,
    reply_origin_number NUMBER(10),
    reply_order NUMBER(10),
    reply_depth NUMBER(10)
);
CREATE TABLE product_review_table
(
    review_num NUMBER(10),
    product_num NUMBER(10),
    user_id VARCHAR2(200),
    review_content VARCHAR2(2000),
    reporting_date DATE,
    review_image1 VARCHAR2(200),
    review_image2 VARCHAR2(200),
    review_grade NUMBER(10)
);