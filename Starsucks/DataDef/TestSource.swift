//
//  TestSource.swift
//  Starsucks
//
//  Created by 孔维锐 on 2023-04-27.
//  Manually migratedn from precedent Playground file.

import Foundation

import SwiftUI



let testProductsRaw = """
咖啡融合冰淇淋,阿馥奇朵™,40,affogato
咖啡融合冰淇淋,麦芽雪冷萃™,35,cold-brew-malt
咖啡融合冰淇淋,冷萃浮乐朵™,35,cold-brew-float
咖啡融合冰淇淋,气致™冷萃浮乐朵™,40,instore-nitro-cold-brew-float
星巴克冷萃咖啡系列,冷萃冰咖啡,30,cold-brew
星巴克冷萃咖啡系列,轻甜奶油冷萃,35,vanilla-flavor-sweet-cream-cold-brew
星巴克冷萃咖啡系列,绵云冷萃,30,cold-foam-cold-brew
手工调制浓缩咖啡,美式咖啡（热/冷）,35,caffe-americano
手工调制浓缩咖啡,拿铁（热/冷）,35,caffe-latte
手工调制浓缩咖啡,摩卡（热/冷),35,caffe-mocha
手工调制浓缩咖啡,卡布奇诺（热/冷）,35,cappuccino
手工调制浓缩咖啡,焦糖玛奇朵（热/冷）,40,caramel-macchiato
手工调制浓缩咖啡,浓缩咖啡,20,espresso
手工调制浓缩咖啡,馥芮白™,40,flat-white
手工调制浓缩咖啡,榛果风味拿铁（热/冷）,35,hazelnut-flavored-latte
星冰乐®,焦糖浓缩咖啡星冰乐,40,vanilla-flavored-latte
星冰乐®,抹茶星冰乐,40,green-tea-frappuccino
星冰乐®,芒果西番莲果茶星冰乐,40,mango-passion-tea
星冰乐®,摩卡星冰乐,40,mocha-frappuccino
星冰乐®,摩卡可可碎片星冰乐,40,mocha-java-chip-frappuccino
星冰乐®,香草风味星冰乐,40,vanilla-flavored-cream-frappuccino-blended-beverage
气致™冷萃咖啡,气致™冷萃咖啡,35,nitro-cold-brew
经典巧克力饮品,经典巧克力饮品（热/冷）,35,signature-chocolate-beverage
茶瓦纳™,红茶拿铁（热/冷）,35,black-tea-latte
茶瓦纳™,抹茶拿铁（热/冷）,35,green-tea-latte
茶瓦纳™,茶瓦纳™ 冰摇柚柚蜂蜜红茶,35,iced-shaken-honey-ruby-grapefruit-black-tea
茶瓦纳™,冰摇红莓黑加仑茶,35,blackcurrant-raspberry
茶瓦纳™,冰摇芒果花草茶,35,iced-shaken-mango-herbal-juiced-tea
茶瓦纳™,茶瓦纳™冰摇桃桃乌龙茶,35,iced-shaken-peach-green-tea
深度烘焙,星巴克ORIGAMI™佛罗娜烘焙咖啡系列,30,origami-verona
中度烘焙,星巴克ORIGAMI™派克市场烘焙咖啡系列,120,origami-pike-place
星巴克VIA® BLACK,星巴克VIA®哥伦比亚免煮咖啡,40,via-colombia
星巴克VIA® BLACK,星巴克VIA®意式烘焙免煮咖啡,40,via-italian-roast
星巴克VIA® DAIRY,星巴克VIA®摩卡风味免煮咖啡固体饮料,40,via-caffe-mocha
星巴克VIA® DAIRY,星巴克VIA®焦糖拿铁风味免煮咖啡固体饮料,40,via-caramel-latte
星巴克VIA® DAIRY,星巴克VIA®香草拿铁风味免煮咖啡固体饮料,40,via-vanilla-latte
中度烘焙,星巴克®哥伦比亚咖啡豆,100,colombia
中度烘焙,星巴克®凤舞祥云综合咖啡豆,100,south-of-the-clouds
烘焙,美式松饼,25,american-style-pancakes
烘焙,蓝莓麦芬,20,blueberry-muffin
烘焙,香浓巧克力麦芬,22,chocolate-muffin
烘焙,旋风玉桂酥,25,cinnamon-swirl
烘焙,法式香酥可颂,30,french-butter-croissant
烘焙,法式焦糖酥,28,french-caramel-bread
烘焙,层层榛子果仁酥,35,hazelnut-croissant
烘焙,蜂蜜提子司康,22,honey-raisin-scone
蛋糕&甜品,蓝莓曲奇风轻乳酪蛋糕,28,blueberry-and-cookie-style-cheesecake
蛋糕&甜品,经典瑞士卷,25,classic-swiss-roll-cake
蛋糕&甜品,浓醇三重黑巧克力蛋糕,30,triple-dark-chocolate-cake
蛋糕&甜品,法式闪电泡芙,22,eclair
蛋糕&甜品,星巴克咖啡提拉米苏蛋糕,35,starbucks-coffee-tiramisu
蛋糕&甜品,法式马卡龙,18,macaron
蛋糕&甜品,纽约风浓郁重芝士蛋糕,35,new-york-style-creamy-cheesecake
其他美食,腰果,18,cashews
其他美食,英伦风味黄油饼干,20,shortbread
其他美食,混合果仁果脯,25,fruitnnuts
其他美食,水果沙拉,35,fruit-salad
其他美食,棒棒糖,18,lollipops
其他美食,咖啡味蛋卷,20,waferrolls
其他美食,薄荷味口香糖（无糖）,10,starbucks-chewing-gum
其他美食,薄荷味硬糖（无糖）,10,Starbucks-mints
三明治、帕尼尼、卷,牛油果鸡肉焙果,30,avocado-and-chicken-bagel
三明治、帕尼尼、卷,培根蛋可颂堡,25,bacon-and-egg-croissant-bun
三明治、帕尼尼、卷,蜜汁培根蛋卷,20,bacon-and-egg-wrap
三明治、帕尼尼、卷,层层牛肉法棍,30,beef-baguette
三明治、帕尼尼、卷,牛肉芝士可颂,25,beef-cheese-croissant
三明治、帕尼尼、卷,凯撒鸡肉卷,25,caesar-chicken-wrap
三明治、帕尼尼、卷,鸡肉芝香帕尼尼,30,chicken-panini
三明治、帕尼尼、卷,炒蛋菌菇虾仁卷,25,eggs-mushroom-shrimp-wrap
酸奶,谷物组合希腊式风味酸奶（混合莓果）,20,greek-flavored-yoghurt-mixed-berry
酸奶,谷物组合希腊式风味酸奶（黄桃）,20,greek-flavored-yoghurt-yellow-peach
常规产品,12oz 烫金品牌黑色马克杯,150,12oz-black-gilded-brand-mug
常规产品,银色/白色亮面品牌桌面杯,100,12oz-silver-white-brand-handle-mug
常规产品,12oz 彰显本色黑色/深灰不锈钢桌面杯,120,12oz-true-essence-stainless-steel-bottle
常规产品,12oz 纯白磨砂玻璃杯,100,12oz-white-frosted-glass-cup
常规产品,12oz 烫金品牌白色马克杯,150,12oz-white-gilded-brand-mug
常规产品,16oz 烫金品牌黑色马克杯,160,16oz-black-gilded-brand-mug
常规产品,16oz 原木黑色拎绳不锈钢保温杯,180,16oz-black-wooden-stainless-steel-bottle-with-strap
常规产品,16oz 彰显本色黑色/深灰不锈钢随行杯,160,16oz-true-essence-stainless-steel-travel-bottle
臻选产品,12oz 纯黑/古铜亮面品牌桌面杯,120,12oz-black-bronze-brand-handle-mug
臻选产品,16oz 香槟金品牌不锈钢桌面杯,150,16oz-champagne-gold-brand-stainless-steel-cup
臻选产品,500ml 金色Logo水瓶,100,500ml-gold-logo-water-bottle
臻选产品,9oz 臻选玻璃杯,80,9oz-reserve-glass-cup
"""
func getTestProducts() -> [Product]{
    var products: [Product] = []
    let pro_str = testProductsRaw.split(separator: "\n")
    for str in pro_str{
        let sub: [String] = str.split(separator: ",").compactMap{ "\($0)" }
        products.append(Product(group: Product.ProductGroup.init(rawValue: sub[0]) ?? .other, title: sub[1], price: Int(sub[2])!, imgSrcLink: sub[3]))
    }
    //print(products)
    return products
}

func getTestOrderHistories() -> [Order]{
    return [
        Order(products: [Product(group: Product.ProductGroup.coffeeFusionIceCream, title: "阿馥奇朵™", price: 40, imgSrcLink: "affogato"), Product(group: Product.ProductGroup.coffeeFusionIceCream, title: "麦芽雪冷萃™", price: 35, imgSrcLink: "cold-brew-malt"), Product(group: Product.ProductGroup.coffeeFusionIceCream, title: "冷萃浮乐朵™", price: 35, imgSrcLink: "cold-brew-float"), Product(group: Product.ProductGroup.coffeeFusionIceCream, title: "气致™冷萃浮乐朵™", price: 40, imgSrcLink: "instore-nitro-cold-brew-float")], note: "不要糖浆", statusHistory: [(Order.OrderStatus.ordered, Date())], settlementHistory: [(Order.SettlementType.charge, Date(), 40)], id: UUID()),
        Order(products: [Product(group: Product.ProductGroup.coffeeFusionIceCream, title: "阿馥奇朵™", price: 40, imgSrcLink: "affogato")], note: "不要糖浆", statusHistory: [(Order.OrderStatus.ordered, Date())], settlementHistory: [(Order.SettlementType.charge, Date(), 40)], id: UUID()),
        
    ]
}
