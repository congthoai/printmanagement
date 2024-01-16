ALTER TABLE pricelist ADD `payout_price` varchar(255) COLLATE utf8_unicode_ci DEFAULT "";
UPDATE pricelist SET payout_price = CONCAT("0:", price);

# zalo
ALTER TABLE printmanagement.orders ADD deliverydate DATETIME DEFAULT null NULL;
ALTER TABLE printmanagement.orders ADD notified BOOL DEFAULT false NULL;
