--Tablo Ekleme--
CREATE TABLE "categories"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id");
CREATE TABLE "products"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL,
    "stock" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "category_id" BIGINT NOT NULL
);
ALTER TABLE
    "products" ADD PRIMARY KEY("id");
CREATE TABLE "customers"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "surname" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "phone" VARCHAR(15) NOT NULL
);
ALTER TABLE
    "customers" ADD PRIMARY KEY("id");
CREATE TABLE "shipping_addresses"(
    "id" SERIAL NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "city" VARCHAR(100) NOT NULL,
    "country" VARCHAR(100) NOT NULL,
    "postal_code" VARCHAR(10) NOT NULL
);
ALTER TABLE
    "shipping_addresses" ADD PRIMARY KEY("id");
CREATE TABLE "orders"(
    "id" SERIAL NOT NULL,
    "order_date" DATE NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "shipping_address_id" BIGINT NOT NULL
);
ALTER TABLE
    "orders" ADD PRIMARY KEY("id");
CREATE TABLE "order_items"(
    "id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "order_id" BIGINT NOT NULL,
    "product_id" BIGINT NOT NULL
);
ALTER TABLE
    "order_items" ADD PRIMARY KEY("id");
CREATE TABLE "reviews"(
    "id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "product_id" BIGINT NOT NULL,
    "customer_id" BIGINT NOT NULL
);
ALTER TABLE
    "reviews" ADD PRIMARY KEY("id");
ALTER TABLE
    "order_items" ADD CONSTRAINT "order_items_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "orders"("id");
ALTER TABLE
    "products" ADD CONSTRAINT "products_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "categories"("id");
ALTER TABLE
    "reviews" ADD CONSTRAINT "reviews_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("id");
ALTER TABLE
    "reviews" ADD CONSTRAINT "reviews_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "products"("id");
ALTER TABLE
    "order_items" ADD CONSTRAINT "order_items_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "products"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_shipping_address_id_foreign" FOREIGN KEY("shipping_address_id") REFERENCES "shipping_addresses"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("id");
-- Veri Ekleme --
1 = Makyaj  
2 = Cilt Bakımı  
3 = Saç Bakımı  
4 = Parfüm  
5 = Vücut Bakımı  
6 = Ağız & Diş Bakımı  
7 = Tırnak Bakımı  
8 = Teknolojik Güzellik Aletleri

INSERT INTO categories (name, description) VALUES
('Makyaj', 'Fondöten, kapatıcı, maskara, ruj ve diğer makyaj ürünleri'),
('Cilt Bakımı', 'Yüz temizleme jelleri, serumlar, tonikler ve nemlendiriciler'),
('Saç Bakımı', 'Şampuan, saç bakım yağları, maskeler ve onarıcı ürünler'),
('Parfüm', 'Kadın ve erkek parfüm çeşitleri'),
('Vücut Bakımı', 'Duş jelleri, losyonlar, peeling ve vücut bakım ürünleri'),
('Ağız & Diş Bakımı', 'Diş macunları, gargaralar ve ağız bakım ürünleri'),
('Tırnak Bakımı', 'Ojeler, tırnak bakım yağları ve tırnak güçlendiriciler'),
('Teknolojik Güzellik Aletleri', 'Yüz temizleme cihazı, saç kurutma makinesi, IPL cihazı ve kişisel bakım cihazları');

INSERT INTO products (name, price, stock, description, category_id) VALUES
('NARS Radiant Creamy Concealer', 1650.00, 40, 'Yüksek kapatıcılı NARS kapatıcı', 1),
('Huda Beauty #FauxFilter Foundation', 1850.00, 30, 'Yüksek kapatıcılık sağlayan fondöten', 1),
('MAC Velvet Teddy Lipstick', 725.00, 60, 'MAC ikonik nude ruj', 1),
('Maybelline Lash Sensational Mascara', 250.00, 80, 'En popüler Maybelline maskara', 1),
('Rare Beauty Soft Pinch Liquid Blush', 1450.00, 35, 'Selena Gomez markası likit allık', 1),
('Fenty Beauty Gloss Bomb Lip Luminizer', 950.00, 40, 'Rihanna’nın ikonik lip gloss ürünü', 1),
('Too Faced Better Than Sex Mascara', 680.00, 55, 'Ünlü hacim veren maskara', 1),
('Charlotte Tilbury Airbrush Flawless Foundation', 2250.00, 20, 'Pürüzsüz bitişli fondöten', 1),
('KIKO Milano Unlimited Double Touch', 399.00, 70, 'Kalıcı likit ruj', 1),
('NYX Can''t Stop Won''t Stop Foundation', 499.00, 45, 'Uzun süre kalıcı NYX fondöten', 1),
('La Roche-Posay Effaclar Jel', 720.00, 50, 'Yağlı ciltler için yüz temizleme jeli', 2),
('The Ordinary Niacinamide 10% + Zinc 1%', 450.00, 70, 'Gözenek ve sebum karşıtı serum', 2),
('CeraVe Moisturizing Cream', 520.00, 65, 'Yoğun nemlendirici yüz kremi', 2),
('Clinique Moisture Surge 72H', 1350.00, 30, '72 saat etkili nemlendirici', 2),
('Bioderma Sensibio H2O', 360.00, 90, 'Hassas ciltlere uygun micellar su', 2),
('Kerastase Elixir Ultime', 1750.00, 30, 'Saç bakım yağı', 3),
('Olaplex No.3 Hair Perfector', 950.00, 40, 'Saç onarıcı bakım ürünü', 3),
('L''Oréal Elseve Dream Long', 150.00, 100, 'Uzun saçları uzatan bakım serisi', 3),
('Pantene Pro-V Miracle Mask', 120.00, 80, 'Saç onarıcı maske', 3),
('Schwarzkopf Gliss Ultimate Repair', 210.00, 85, 'Yoğun onarıcı saç kremi', 3),
('MAC Turquatic 50ml', 2050.00, 25, 'MAC imza parfümü', 4),
('Yves Saint Laurent Libre EDP 50ml', 3450.00, 20, 'Kadın parfüm – çiçeksi koku', 4),
('Miss Dior Blooming Bouquet 50ml', 3150.00, 18, 'Ferahlık veren çiçeksi kadın parfümü', 4),
('Victoria''s Secret Bombshell 50ml', 2290.00, 22, 'Meyvemsi çiçeksi kadın parfümü', 4),
('Lancome La Vie Est Belle 50ml', 3050.00, 15, 'Tatlı ve çiçeksi kadın parfümü', 4),
('Bath & Body Works Warm Vanilla Sugar Body Lotion', 480.00, 60, 'Vanilya kokulu body lotion', 5),
('Nivea Soft Nemlendirici Krem', 110.00, 120, 'Hafif nemlendirici krem', 5),
('Dove Shea Butter Duş Jeli', 75.00, 150, 'Shea yağı içerikli duş jeli', 5),
('Rituals Sakura Body Scrub', 650.00, 35, 'Peeling etkili vücut bakım ürünü', 5),
('Palmolive Aroma Sensations Duş Jeli', 65.00, 200, 'Aromatik duş jeli', 5),
('Colgate Optic White Expert White', 120.00, 100, 'Diş beyazlatıcı macun', 6),
('Sensodyne Rapid Relief', 95.00, 90, 'Hızlı rahatlatıcı hassasiyet macunu', 6),
('Listerine Cool Mint Ağız Gargarası', 90.00, 110, 'Ferahlık veren gargara', 6),
('Oral-B Pro Expert Diş İpi', 60.00, 80, 'Gelişmiş diş ipi', 6),
('Marvis Classic Strong Mint', 180.00, 70, 'Lüks nane aromalı diş macunu', 6),
('OPI Nail Lacquer', 340.00, 60, 'Dayanıklı oje', 7),
('Golden Rose Nail Hardener', 75.00, 90, 'Tırnak güçlendirici', 7),
('Flormar Quick Dry Nail Enamel', 49.00, 120, 'Hızlı kuruyan oje', 7),
('Sally Hansen Miracle Gel', 230.00, 55, 'Jel etkili oje', 7),
('Essie Ballet Slippers Oje', 210.00, 50, 'Balerin pembesi oje', 7),
('Dyson Supersonic Saç Kurutma Makinesi', 14999.00, 10, 'Profesyonel saç kurutma makinesi', 8),
('Philips Lumea Prestige IPL', 11499.00, 12, 'IPL epilasyon cihazı', 8),
('Foreo Luna 4 Plus', 6999.00, 15, 'Yüz temizleme cihazı', 8),
('Braun Silk-épil 9 Flex', 4499.00, 20, 'Esnek başlıklı epilatör', 8),
('Babyliss Curl Secret Ionic', 2499.00, 18, 'Otomatik saç maşası', 8);

select *from products;

select
products."name" as "Ürün Adı",
products.price as "Ürün Ücreti",
products.stock as " Stok Durumu",
products.description as "Ürün Açıklaması",
categories."name" as "Kategori Adı"
from products inner join categories on products.category_id = categories.id;

INSERT INTO customers (name, surname, email, phone) VALUES
('Dila Yeliz', 'Yıldırım', 'dila.yeliz@gmail.com', '0581 234 56 78'),
('Deniz', 'İlkay', 'deniz.ilkay@gmail.com', '0593 847 29 14'),
('Masal', 'Önder', 'masal.onder@gmail.com', '0587 562 48 93'),
('Çağla', 'Uçar', 'cagla.ucar@gmail.com', '0591 936 27 85'),
('Melike', 'Dinç', 'melike.dinc@gmail.com', '0584 715 36 42'),
('Rabia', 'Özcan', 'rabia.ozcan@gmail.com', '0592 498 63 17'),
('Mürselin', 'Kesgin', 'murselin.kesgin@gmail.com', '0589 321 75 46'),
('İrem', 'Şensöz', 'irem.sensoz@gmail.com', '0594 783 15 29'),
('Berra', 'Önder', 'berra.onder@gmail.com', '0583 642 19 58'),
('Gökay', 'Konuk', 'gokay.konuk@gmail.com', '0597 519 38 24');

select *from customers;

INSERT INTO shipping_addresses (address, city, country, postal_code) VALUES
('Ataköy 7. Kısım Çamlık Sok. No:14/3, Bakırköy', 'İstanbul', 'Türkiye', '34158'),
('Beşiktaş Mah. Dolmabahçe Cad. No:5/2, Beşiktaş', 'İstanbul', 'Türkiye', '34353'),
('Kozyatağı Mah. Menekşe Sok. No:13/1, Kadıköy', 'İstanbul', 'Türkiye', '34742'),
('Merdivenköy Mah. Üçüncü Yol Sok. No:21/6, Kadıköy', 'İstanbul', 'Türkiye', '34732'),
('Bahçelievler Mah. Mevlana Cad. No:22/5, Çankaya', 'Ankara', 'Türkiye', '06490'),
('Ulus Mah. Tuna Sok. No:3/1, Altındağ', 'Ankara', 'Türkiye', '06540'),
('Küçükesat Mah. Kırlangıç Sok. No:4/3, Çankaya', 'Ankara', 'Türkiye', '06660'),
('Nilüfer Mah. Çiçek Sok. No:8/2, Nilüfer', 'Bursa', 'Türkiye', '16140'),
('Sümer Mah. Çınar Cad. No:11/4, Merkezefendi', 'Denizli', 'Türkiye', '20020'),
('Karaman Mah. Pınar Sok. No:16/3, Pamukkale', 'Denizli', 'Türkiye', '20150'),
('Menteşe Mah. Zeytin Sok. No:19/1, Menteşe', 'Muğla', 'Türkiye', '48000'),
('Güzelköy Mah. Zeytinlik Sok. No:6/1, Menteşe', 'Muğla', 'Türkiye', '48010'),
('Yakutiye Mah. Gürsel Sok. No:6/1, Yakutiye', 'Erzurum', 'Türkiye', '25070'),
('İsmetpaşa Mah. Emin Ağa Sok. No:17/3, Merkez', 'Çanakkale', 'Türkiye', '17020'),
('Sakarya Mah. Şehitler Cad. No:12/5, Biga', 'Çanakkale', 'Türkiye', '17200');


select *from shipping_addresses;

INSERT INTO orders (order_date, customer_id, shipping_address_id) VALUES
('2025-09-14', 3, 11),  -- Masal → Muğla (Güzelköy)
('2025-10-02', 1, 2),   -- Dila → İstanbul Beşiktaş
('2025-10-18', 7, 8),   -- Mürselin → Bursa 
('2025-11-05', 5, 14),  -- Melike → Çanakkale Merkez
('2025-09-27', 9, 3),   -- Berra → İstanbul Kadıköy
('2025-10-29', 2, 10),  -- Deniz → Denizli Pamukkale 
('2025-11-12', 10, 15), -- Gökay → Çanakkale Biga
('2025-10-07', 4, 1),   -- Çağla → İstanbul Bakırköy
('2025-11-03', 6, 9),   -- Rabia → Denizli Merkezefendi
('2025-09-19', 8, 5);   -- İrem → Ankara Altındağ

select * from orders;

select 
    orders.order_date as "Sipariş Tarihi",
    customers.name as "Müşteri Adı",
    customers.surname as "Müşteri Soyadı",
	shipping_addresses.city as "Şehir",
    shipping_addresses.address as "Teslimat Adresi"
from orders 
inner join customers on orders.customer_id = customers.id
inner join shipping_addresses on orders.shipping_address_id = shipping_addresses.id;

INSERT INTO order_items (quantity, order_id, product_id) VALUES --Sipariş Detayı
(1, 1, 12),     -- Huda Foundation
(2, 1, 8),      -- 2 adet MAC Velvet Teddy
(1, 2, 17),     -- MAC Turquatic
(1, 2, 19),     -- Miss Dior Blooming Bouquet
(1, 2, 12),     -- Huda Foundation
(1, 2, 43),     -- Philips Lumea IPL
(2, 2, 7),      -- 2 adet Rare Beauty Soft Pinch Blush
(2, 3, 34),     -- 2 adet Rituals Sakura Scrub
(1, 3, 33),     -- 1 adet Nivea Soft krem
(1, 4, 45),     -- Babyliss Curl Secret
(3, 4, 21),     -- 3 adet Urban Decay Setting Spray
(1, 5, 8),      -- MAC Velvet Teddy
(2, 5, 1),      -- 2 adet NYX Foundation
(1, 6, 39),     -- Sensodyne Rapid Relief
(2, 6, 27),     -- 2 adet Colgate Optic White
(1, 7, 44),     -- Braun Silk Epil
(3, 7, 29),     -- 3 adet Dove Body Wash
(2, 8, 1),      -- 2 adet NYX Foundation
(1, 8, 14),     -- Rare Beauty Mascara
(1, 9, 33),     -- Nivea Soft krem
(2, 9, 11),     -- 2 adet Maybelline Lash Sensational
(1, 10, 27),    -- Colgate Optic White
(2, 10, 34);    -- 2 adet Rituals Sakura Scrub

select * from order_items;

select 
    orders.id as "Müşteri Numarası",
	customers.name || ' ' || customers.surname as "Müşteri",
--	products.name as "Ürün Adı",
--products.price as "Ürün Fiyatı",
--order_items.quantity as "Satın Alınan Miktar",
--(order_items.quantity * products.price) as "Ara Toplam",
	calculate_order_total(orders.id) as "Toplam Tutar"
from orders
--inner join orders on order_id = orders.id;
inner join customers on orders.customer_id = customers.id;
inner join products on product_id = products.id;



--select AVG(price) as "Ürünlerin Fiyat Ortalaması" from Products;
select sum(price) as "Ürünlerin Fiyat Toplamı" from Products ;
select Min(stock) as "En Düşük Stok Miktarı" from products;

select count(*) as "Ürün Sayısı" from products;

select
AVG(price) as "Ürünlerin Fiyat Ortalaması",
sum(price) as "Ürünlerin Fiyat Toplamı",
Min(stock) as "En Düşük Stok Miktarı",
count(*) as "Ürün Sayısı" from Products;

--1. Fonksiyonlar (3 adet)
--calculate_order_total(order_id) - Sipariş toplam tutarını hesaplayan fonksiyon
--customer_lifetime_value(customer_id) - Müşterinin toplam alışveriş tutarını hesaplayan
--stock_status(product_id) - Stok durumunu kontrol eden (Bol/Orta/Az/Tükendi) fonksiyon

select 
    orders.id as "Sipariş Numarası",
	customers.name || ' ' || customers.surname as "Müşteri",
	sum(order_items.quantity * products.price) as "Toplam Sepet Tutarı"
	
from order_items
inner join orders on order_id = orders.id
inner join customers on orders.customer_id = customers.id
inner join products on product_id = products.id
group by "Sipariş Numarası", "Müşteri";



create or replace function calculate_order_total (order_id_sum bigint)
returns DECIMAL(10, 2)

as $$
declare toplam DECIMAL(10, 2);

begin 
select 
    
	sum(order_items.quantity * products.price) as "Toplam Sepet Tutarı"
	into toplam
	
from order_items
inner join orders on order_id = orders.id
inner join customers on orders.customer_id = customers.id
inner join products on product_id = products.id
where order_items.order_id = order_id_sum;

return toplam;
end;
$$ LANGUAGE plpgsql
;


select calculate_order_total(1);

create or replace function customer_lifetime_value (customer_id_sum bigint)
returns DECIMAL(10, 2)
as $$
declare toplam DECIMAL(10, 2);

begin
    select 
        sum(order_items.quantity * products.price) as "Toplam Tutar"
    into toplam
    from order_items
    inner join orders on order_items.order_id = orders.id
    inner join customers on orders.customer_id = customers.id
    inner join products on order_items.product_id = products.id
    where orders.customer_id = customer_id_sum;

    return toplam;
end;
$$ LANGUAGE plpgsql;

select customer_lifetime_value(5);

create or replace function stock_status (product_id_stock bigint)
returns varchar
as $$
declare stok_miktari int;
declare durum varchar;

begin
    --Ürün var mı kontrol et +  stok miktarı
    select products.stock
    into stok_miktari
    from products
    where products.id = product_id_stock;

    -- Ürün bulunamadıysa
    if stok_miktari is null then
        durum := 'Ürün Bulunamadı';

    -- Stok 0 
    elsif stok_miktari = 0 then
        durum := 'Tükendi';

    -- Az stok
    elsif stok_miktari < 10 then
        durum := concat('Az (', stok_miktari, ' adet)');


    -- Orta stok
    elsif stok_miktari < 20 then
        durum :=  concat('Orta (', stok_miktari, ' adet)');


    else
        durum := concat('Bol (', stok_miktari, ' adet)');

    end if;

    return durum;
end;
$$ LANGUAGE plpgsql;

select stock_status(7);

--. Triggerlar (3 adet)
--●	Sipariş oluşturulduğunda stok miktarını düşüren trigger
--●	Ürün fiyatı güncellendiğinde log tutan trigger
--●	Sipariş iptal edildiğinde stokları geri yükleyen trigger


create or replace function fn_reduce_stock()
returns trigger
language plpgsql
as $$
begin
    -- Ürünün stoğunu azalt
    update products
    set stock = stock - NEW.quantity
    where id = NEW.product_id;
	
    RAISE NOTICE ,
        NEW.product_id,
        (select stock from products where id = NEW.product_id);

    return NEW;
end;
$$;

create or replace trigger trg_reduce_stock
after insert on order_items
for each row
execute function fn_reduce_stock();

------●	Ürün fiyatı güncellendiğinde log tutan trigger-------
create table price_logs (
    id serial primary key,
    product_id bigint,
    old_price numeric,
    new_price numeric,
    changed_at timestamp default now()
);

create or replace function fn_log_price_change()
returns trigger
language plpgsql
as $$
begin
    
    insert into price_logs (product_id, old_price, new_price)
    values (OLD.id, OLD.price, NEW.price);

    RAISE NOTICE 'Fiyat değişti → Ürün: %, Eski: %, Yeni: %',
        OLD.id, OLD.price, NEW.price;

    return NEW;
end;
$$;

create trigger trg_log_price
after update of price on products
for each row
when (OLD.price <> NEW.price)
execute function fn_log_price_change();


-------●Sipariş iptal edildiğinde stokları geri yükleyen trigger -------
create or replace function fn_restore_stock()
returns trigger
language plpgsql
as $$
begin
    update products
    set stock = stock + OLD.quantity
    where id = OLD.product_id;

    RAISE NOTICE 'Stok geri yüklendi → Ürün: %, Eklenen: % adet',
        OLD.product_id, OLD.quantity;

    return OLD;
end;
$$;

create trigger trg_restore_stock
after delete on order_items
for each row
execute function fn_restore_stock();

---Test 1 Sipariş Oluşturulunca Stok Durumu---

--Stok Kontrol--
select id, name, stock from products where id = 8; --20 adet

--Yeni Sipariş --
insert into order_items (quantity, order_id, product_id)
values (1, 1, 8);

--Stok Yeniden Kontrol--
select id, name, stock from products where id = 8; --19 adet

---Test 2 Ürün Fiyatı Güncellenince Log Tutan Trigger ---

--Fiyat Kontrol--
select id, name, price from products where id = 7; --680 tl

--Fiyat Değişimi Yaptım--
update products
set price = 850
where id = 7;

--Fiyat Değişimi Yansıdı mı Kontrolü--
select * from price_logs order by id desc;


---Test 3 Sipariş İptal Edilince Stok Geri Yükleniyor Mu--

--Stok miktarı--
select id, name, stock from products where id = 7; --- (2, 2, 7) 55 adet

--Siparişi sil--
delete from order_items
where order_id = 2
and product_id = 7;

--Stok Kontorolü--
select id, name, stock from products where id = 7; --57 adet


--3. Stored Procedure'ler (2 adet)
---●	sp_place_order() - Sipariş verme işlemi (stok kontrolü dahil)
---●	sp_cancel_order() - Sipariş iptal etme işlemi

-- Sipariş verme işlemi (stok kontrolü dahil)
create or replace procedure sp_place_order(
    p_customer_id bigint,
    p_shipping_address_id bigint,
    p_product_id bigint,
    p_quantity int
)
language plpgsql
as $$
    declare
        v_stock int;
        v_order_id bigint;

    begin
        select stock 
        into v_stock 
        from products 
        where id = p_product_id;

        if v_stock is null then
            raise exception 'Ürün bulunamadı.';
        end if;

        if v_stock < p_quantity then
            raise exception 'Yetersiz stok.';
        end if;

        insert into orders(order_date, customer_id, shipping_address_id)
        values (current_date, p_customer_id, p_shipping_address_id)
        returning id into v_order_id;

        insert into order_items(quantity, order_id, product_id)
        values (p_quantity, v_order_id, p_product_id);

        raise notice 'Sipariş oluşturuldu. ID: %', v_order_id;
    end;
$$;

select id, name, stock from products where id = 7;
call sp_place_order(1, 2, 7, 2);
select id, name, stock from products where id = 7;



-- Sipariş iptal etme işlemi
create or replace procedure sp_cancel_order(
    p_order_id bigint
)
language plpgsql
as $$
    declare
        v_count int;

    begin
        select count(*) 
        into v_count 
        from orders 
        where id = p_order_id;

        if v_count = 0 then
            raise exception 'Sipariş bulunamadı.';
        end if;

        delete from order_items 
        where order_id = p_order_id;

        delete from orders 
        where id = p_order_id;

        raise notice 'Sipariş iptal edildi. ID: %', p_order_id;
    end;
$$;

select * from order_items where order_id = 11;
call sp_cancel_order(11);
select id, name, stock from products where id = 7; --En baştaki stok miktarına döndü.

-- 4. View'lar (2 adet)
--●	Kategorilere göre ürün satış istatistikleri
--●	Müşteri sipariş özeti (toplam sipariş, toplam tutar, ortalama sepet)

--Kategorilere göre ürün satış istatistikleri
create or replace view vw_category_sales_stats as
select
    c.id as "Kategori Id",
    c.name as "Kategori Adı",
    sum(oi.quantity) as "Toplam Satış Adedi",
    sum(oi.quantity * p.price) as "Toplam Satış Tutarı",
    avg(p.price) as "Ortalama Fiyat"
from categories c
left join products p on p.category_id = c.id
left join order_items oi on oi.product_id = p.id
group by c.id, c.name;

select * from vw_category_sales_stats;

--Müşteri sipariş özeti (toplam sipariş, toplam tutar, ortalama sepet

create or replace view vw_customer_order_summary as
select
    c.id as "Müşteri Id",
    c.name || ' ' || c.surname as "Müşteri Adı",
    count(distinct o.id) as "Toplam Sipariş",
    sum(oi.quantity * p.price) as "Toplam Tutar",
    avg(oi.quantity * p.price) as "Ortalama Sepet"
from customers c
left join orders o on o.customer_id = c.id
left join order_items oi on oi.order_id = o.id
left join products p on p.id = oi.product_id
group by c.id, "Müşteri Adı";

select * from vw_customer_order_summary;


--En Çok Satan Ürünler (TOP 10)

select
    p.name as "Ürün Adı",
    sum(oi.quantity) as "Toplam Satış Adedi",
    sum(oi.quantity * p.price) as "Toplam Satış Tutarı"
from order_items oi
inner join products p on p.id = oi.product_id
group by p.name
order by "Toplam Satış Adedi" desc
limit 10;


--Kategorilere Göre Ortalama Ürün Fiyatları ve Stok Durumları
select
    c.name as "Kategori Adı",
    avg(p.price) as "Ortalama Fiyat",
    sum(p.stock) as "Toplam Stok",
    min(p.stock) as "En Düşük Stok",
    max(p.stock) as "En Yüksek Stok"
from categories c
left join products p on p.category_id = c.id
group by c.name;

--Subquery ile Ortalama Sipariş Tutarından Yüksek Siparişler
select
    orders.id as "Sipariş Id",
    concat(customers.name, ' ', customers.surname) as "Müşteri",
    sum(order_items.quantity * products.price) as "Sipariş Tutarı"
from orders
inner join customers on customers.id = orders.customer_id
inner join order_items on order_items.order_id = orders.id
inner join products on products.id = order_items.product_id
group by orders.id, "Müşteri"
having sum(order_items.quantity * products.price) >
(
    select avg(toplam_tutar)
    from (
            select 
                sum(order_items.quantity * products.price) as toplam_tutar
            from order_items
            inner join products on products.id = order_items.product_id
            inner join orders on orders.id = order_items.order_id
            group by orders.id
        ) as toplamlar
);







