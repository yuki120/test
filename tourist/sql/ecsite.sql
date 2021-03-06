set names utf8;
set foreign_key_checks = 0;
drop database if exists ecsite_takada;

create database if not exists ecsite_takada;
use ecsite_takada;

drop table if exists login_user_transaction;

create table login_user_transaction(
	id int not null primary key auto_increment,
	login_id varchar(16) not null unique,
	login_pass varchar(16) not null,
	name varchar (16) not null,
	name_kana varchar (32) not null,
	sex varchar (16) not null,
	email varchar (50) not null,
	tel_num varchar (16) not null,
	postal_code varchar (16) not null,
	address1 varchar (50) not null,
	address2 varchar (16),
	insert_date datetime,
	updated_date datetime
);

drop table if exists product_info_transaction;

create table product_info_transaction(
	id int not null primary key auto_increment,
	product_category varchar (32) not null,
	product_name varchar (32) not null,
	product_price int not null,
	product_stock int not null,
	product_description varchar (255) not null,
	image_file_path varchar (255) not null,
	insert_date datetime,
	update_date datetime
);

drop table if exists user_buy_item_transaction;

create table user_buy_item_transaction(
	id int not null primary key auto_increment,
	item_transaction_id int,
	total_price int,
	total_count int,
	user_master_id varchar(16),
	pay varchar(30),
	insert_date datetime,
	update_date datetime
);

drop table if exists user_review_transaction;

create table user_review_transaction(
	id int not null primary key auto_increment,
	product_name varchar (32) not null,
	user_master_id varchar(16) not null,
	handle_name varchar(16) not null,
	title varchar(50) not null,
	comment varchar(255) not null,
	insert_date datetime,
	update_date datetime
);


INSERT INTO login_user_transaction(login_id, login_pass, name, name_kana, sex, email, tel_num, postal_code, address1, address2)
VALUES ("master", "master01", "管理者", "かんりしゃ", "man", "master@gmail.com", "000-0000-0000", "000-0000", "東京都", ""),
("taro", "taro123", "山田太郎", "やまだたろう", "man", "taro@gmail.com", "090-0000-0000", "123-1234", "東京都西東京市5-16", "サザンカ101");

INSERT INTO product_info_transaction(product_category, product_name, product_price, product_stock, product_description, image_file_path)
VALUES("ヨーロッパ", "パリ8日間の旅", 269000, 10, "オプション満載の大人気プラン！", "./images/paris.jpg"),
("ヨーロッパ", "バルセロナ8日間の旅", 220000, 10, "サグラダ・ファミリアの入場券込み！", "./images/barcelona.jpg"),
("ヨーロッパ", "ロンドン6日間", 214000, 10, "日本人ガイドと湖水地方を巡り！", "./images/london.jpg"),
("リゾート", "グアム4日間の旅", 150000, 10, "選べるマリンスポーツ付き！", "./images/guam.jpg"),
("リゾート", "ハワイ5日間の旅", 180000, 10, "完全フリープラン！海が見えるお部屋！", "./images/hawaii.jpg"),
("リゾート", "プーケット5日間の旅", 70000, 10, "島内観光ツアー付き！", "./images/phucket.jpg"),
("リゾート", "セブ5日間の旅", 100000, 10, "デラックスホテル滞在プラン！", "./images/sebu.jpg"),
("リゾート", "バリ島5日間の旅", 80000, 10, "マッサージ無料券、プレゼント！", "./images/bali.jpg"),
("アジア", "ソウル3日間の旅", 30000, 10, "韓流ドラマ聖地巡りツアー付き！", "./images/soul.jpg"),
("アジア", "台北3日間の旅", 35000, 10, "千と千尋の舞台九份への観光プラン付き！", "./images/taipei.jpg"),
("アメリカ", "ロサンゼルス5日間の旅", 210000, 10, "映画の本場！ハリウッドを巡る！", "./images/losangels.jpg"),
("アメリカ", "ニューヨーク6日間の旅", 350000, 10, "本場ブロードウェイミュージカル観賞券付き！", "./images/newyork.jpg"),
("オーストラリア", "ケアンズ5日間の旅", 130000, 10, "グレートバリアリーフが楽しめる！", "./images/keans.jpg"),
("オーストラリア", "ゴールドコースト5日間の旅", 120000, 10, "世界遺産の熱帯雨林を巡る！", "./images/goldcoast.jpg"),
("オーストラリア", "メルボルン6日間の旅", 140000, 10, "英国風のオシャレな街を散策！", "./images/melbourn.jpg");

INSERT INTO user_review_transaction(product_name, user_master_id, handle_name, title, comment)
VALUES ("パリ8日間の旅", "taro", "たろきち", "楽しかった！", "パリのいろんな観光名所を見て回ることができて、非常に有意義な時間を過ごすことができました！"),
("台北3日間の旅", "taro", "くまもん", "暑かった！", "めちゃくちゃ暑かったけど、おいしいものがたくさん食べられて、とてもたのしかった！");