library(xml2)
library(rvest)
library(stringr)

#read URL
url<-'https://www.amazon.in/dp/B07WJV5KPL/ref=sspa_dk_hqp_detail_aax_0?psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFQR0hRSVpFQTg4N0wmZW5jcnlwdGVkSWQ9QTA1MjQ2MzczT1FXQlU5VlAyNzdUJmVuY3J5cHRlZEFkSWQ9QTAwNzU1OTgxTFdET1hBMlBNOTM4JndpZGdldE5hbWU9c3BfaHFwX3NoYXJlZCZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU='
webpage<-read_html(url)

#title
title_html<-html_nodes(webpage,'h1#title')
title<-html_text(title_html)
head(title)
str_replace_all(title,"[\r\n]","")

#price of product
price_html <- html_nodes(webpage, 'span#priceblock_ourprice')
price <- html_text(price_html)
head(price)

#product description
desc_html <- html_nodes(webpage, 'div#feature-bullets')
desc <- html_text(desc_html)
head(desc)
str_replace_all(desc,"[\r\n]","")

#rating
rate_html <- html_nodes(webpage,'span#acrPopover')
rate <- html_text(rate_html)
head(rate)
str_replace_all(rate,"[\r\n]","")

#Size of the product
size_html <- html_nodes(webpage, 'div#variation_style_name') 
size_html <- html_nodes(size_html, 'span.selection')
size <- html_text(size_html)
head(size)
str_replace_all(size,"[\r\n]","")

#Color of the product
color_html <- html_nodes(webpage, 'div#variation_color_name')
color_html <- html_nodes(color_html, 'span.selection')
color <- html_text(color_html)
head(color)
str_replace_all(color ,"[\r\n]","")

#combine all the list
frameproduct_data <- data.frame(Title=title, Price=price, 
Description=desc, Rating=rate, Size=size, Color=color)
str(product_data)



