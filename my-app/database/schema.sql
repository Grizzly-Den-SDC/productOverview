DROP SCHEMA IF EXISTS prodTestSchema;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS related CASCADE;
DROP TABLE IF EXISTS features CASCADE;
DROP TABLE IF EXISTS styles CASCADE;
DROP TABLE IF EXISTS photos CASCADE;
DROP TABLE IF EXISTS skus CASCADE;

CREATE SCHEMA prodTestSchema AUTHORIZATION malcolmmarshall;

CREATE TABLE photos (
  id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  styleId int,
  url VARCHAR,
  thumbnail_url VARCHAR
);

copy photos (styleId, url, thumbnail_url) from '/Users/malcolmmarshall/Downloads/photos.csv' delimiter ',' csv header;
DROP INDEX IF EXISTS photos_key;
CREATE INDEX photos_key ON photos (id);


CREATE TABLE products (
product_id int,
name VARCHAR(50),
slogan VARCHAR(500),
description VARCHAR(500),
category VARCHAR(50),
default_price VARCHAR(50),
PRIMARY KEY (product_id)
);

copy products from  '/Users/malcolmmarshall/Desktop/product.csv' delimiter ',' csv header;
DROP INDEX IF EXISTS product_key;
CREATE INDEX product_key ON products (product_id);

CREATE TABLE features (
  id int,
  product_id int,
  feature VARCHAR(50),
  value VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE INDEX feature_key ON features (id);
copy features from '/Users/malcolmmarshall/Desktop/features.csv' delimiter ',' csv;


CREATE TABLE styles (
  style_id int,
  productId int,
  name VARCHAR(50),
  sale_price VARCHAR(50),
  original_price VARCHAR(50),
  default_style BOOLEAN,
  PRIMARY KEY (style_id)
);

CREATE INDEX style_key ON styles (productId);

copy styles from '/Users/malcolmmarshall/Desktop/styles.csv' delimiter ',' csv header;

CREATE TABLE skus (
  id int,
  styleId int,
  size VARCHAR(50),
  quantity int,
  PRIMARY KEY (id)
);

CREATE INDEX skus_key ON skus (id);

copy skus from '/Users/malcolmmarshall/Desktop/skus.csv' delimiter ',' csv header;
