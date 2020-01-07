/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.4.8-MariaDB : Database - db_cocktails
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_cocktails` /*!40100 DEFAULT CHARACTER SET utf32 */;

USE `db_cocktails`;

/*Table structure for table `cocktail` */

DROP TABLE IF EXISTS `cocktail`;

CREATE TABLE `cocktail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `strength` int(11) NOT NULL,
  `ingredients` text NOT NULL,
  `style` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(100) DEFAULT 'blue',
  `country` varchar(100) NOT NULL,
  `mix` text NOT NULL,
  `picture` varchar(500) DEFAULT '/images/18.png',
  `season` int(11) DEFAULT NULL,
  `moment` int(11) DEFAULT NULL,
  `main_ingredient` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `style` (`style`),
  KEY `season` (`season`),
  KEY `moment` (`moment`),
  KEY `cocktail-strength` (`strength`),
  CONSTRAINT `cock_ibfk_1` FOREIGN KEY (`style`) REFERENCES `style` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cocktail_ibfk_1` FOREIGN KEY (`season`) REFERENCES `season` (`id`),
  CONSTRAINT `cocktail_ibfk_3` FOREIGN KEY (`strength`) REFERENCES `strength` (`id`),
  CONSTRAINT `cocktail_ibfk_4` FOREIGN KEY (`moment`) REFERENCES `moment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

/*Data for the table `cocktail` */

insert  into `cocktail`(`id`,`name`,`strength`,`ingredients`,`style`,`price`,`color`,`country`,`mix`,`picture`,`season`,`moment`,`main_ingredient`) values 
(10,'Espresso Martini',4,'2 parts vodka ? parts coffee liqueur 1 part sugar syrup 2? parts coffee\n                     ',1,1,'brown','Tunis','fill up the shaker with ice cubes\r\npour vodka sugar syrup coffee liqueur coffee into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/10.png',1,1,'Vodka'),
(11,'Ocean View',5,'1½ parts vodka ½ parts dry vermouth ½ parts mint liqueur ½ parts Blue Curacao ice',4,1,'blue/green','Thailand','add vodkamint liqueur ice dry vermouth Blue Curacao to the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with lemon spiral','/images/11.png',2,1,'Vodka'),
(12,'Chocolate Martini',5,'4 parts vodka 2 parts White Crème de Cacao 1 splash chocolate syrup ice cubes',1,1,'brown','ff','garnish with chocolate stripes on glass\r\nfill up the shaker with ice cubes\r\npour White Crème de Cacao vodka into the shaker\r\nshake well\r\nstrain into the glass','/images/12.png',1,2,'Vodka'),
(13,'After Eight Martini',3,'1 part vodka 2 parts irish cream 1 part mint liqueur ice cubes',1,1,'blue/green','','fill up the shaker with ice\r\npour mint liqueur irish cream vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/13.png',2,6,'Vodka'),
(14,'Apple Martini',5,'3 parts vodka 1½ parts apple schnapps 1 part lemon juice ice cubes',8,1,'blue/green','v','fill up the mixer glass with ice\r\npour vodka lemon juice apple schnapps into the mixer glass\r\nshake well\r\nstrain into the cocktail glass','/images/14.png',2,6,'Vodka'),
(15,'Appletini',5,'4 parts vodka 2 parts apple juice ice cubes',8,1,'blue/green','','fill up the mixer glass with ice\r\npour vodka lemon juice apple schnapps into the mixer glass\r\nshake well\r\nstrain into the cocktail glass','/images/15.png',1,2,'Vodka'),
(16,'Candy Cane Martini',5,'3 parts vanilla vodka ½ parts mint liqueur ice cubes',8,1,'blue/green','','fill up the shaker with ice pour mint liqueur vanilla vodka into the shaker shake well strain into the cocktail glass garnish with','/images/16.png',1,1,'Vodka'),
(17,'Greentini',5,'4 parts vodka 2 parts Midori ice cubes\r\n',8,1,'blue/green','','fill up the shaker with ice pour Midori vodka into the shaker shake well strain into the cocktail glass garnish with lime wedge\r\n','/images/17.png',2,6,'Vodka'),
(18,'Grinch',3,'4 parts Midori 1 part lemon juice 2 dashes sugar syrup ice cubes\r\n',8,1,'blue/green','','fill up the shaker with ice pour sugar syrup \r\nlemon juice Midori into the shaker \r\nshake well strain into the cocktail glass garnish\r\n with candy stick cocktail cherry','/images/18.png',2,1,'Vodka'),
(19,'Luckytini',3,'2 parts vodka 1 part Midori 1 part pineapple juice ice cubes',8,1,'blue/green','','fill up the shaker with ice pour pineapple juice Midori vodka into the shaker \r\nshake well strain into the cocktail glass garnish with orange wedge','/images/19.png',2,5,'Vodka'),
(20,'Midori Cosmopolitan',3,'1 part Midori 1 part citrus vodka 1 part cranberry juice ½ parts lemon juice ice cubes',8,1,'blue/green','','fill up the shaker with ice pour lemon juice cranberry juice \r\ncitrus vodka Midori into the shaker shake well strain into the \r\ncocktail glass garnish with raspberry','/images/20.png',2,2,'Vodka'),
(21,'Mintini',5,'2 parts vodka 1 part mint liqueur 1 part peppermint schnapps ice cubes',8,1,'blue/green','','fill up the shaker with ice pour peppermint schnapps mint liqueur vodka\r\n into the shaker shake well strain into the cocktail glass garnish with candy cane','/images/21.png',1,2,'Vodka'),
(22,'Bikini Martini',3,'1 part coconut rum 1 part vodka 1 part pineapple juice 1 dash grenadine ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice pour pineapple juice vodka coconut rum into\r\n the shaker shake well strain into the cocktail glass pour grenadine into the glass','/images/22.png',1,6,'Vodka'),
(23,'Carrie Bradshaw',5,'1? parts vodka ? parts gin ? parts Orange Curacao ? parts sugar syrup 1 part lime juice ? parts cranberry juice 1 dash club soda 2 dashes Peychaud\'s Bitters ice cubes \n                     \n                     \n                     \n                     ',8,1,'red/orange/pink','','add ice to the shaker pour vodka sugar syrup lime juice Peychaud\'s Bitters gin \ncranberry juice Orange Curacao into \nthe shaker shake well strain into the cocktail glass pour club soda into the glass','/images/23.png',1,1,'Vodka'),
(24,'Cosmopolitan',3,'¾ parts Cointreau 2 parts citrus vodka ¾ parts lime juice 1½ parts cranberry juice ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice cubes pour vodka cranberry juice lime juice \r\nCointreau into the shaker shake \r\nwell strain into the cocktail glass garnish with orange wedge','/images/24.png',1,2,'Vodka'),
(25,'French Martini',5,'3 parts vodka 2½ parts pineapple juice ½ parts blackcurrant liqueur ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice cubes add vodka pineapple juice blackcurrant \r\nliqueur to the shaker shake well strain into the cocktail glass','/images/25.png',2,6,'Vodka'),
(26,'The Glamour Gal',5,'3 parts vodka ¾ parts lemon juice ¾ parts lime juice ¾ parts sugar syrup 1 drop blackcurrant liqueur ice',8,1,'other','','garnish with sugar rim add ice to the shaker\r\n pour vodka sugar syrup lime juice lemon juice into the shaker shake well \r\nstrain into the\r\n glass add blackcurrant liqueur to the glass','/images/26.png',1,1,'Vodka'),
(27,'Blueberry Martini',5,'4 parts vodka 1 part blueberry liqueur 1 part water 1 dash sugar syrup ice',8,1,'red/orange/pink','','add ice cubes to the shaker add water vodka sugar syrup blueberry liqueur to the shaker \r\nshake well strain into the cocktail glass garnish with berries','/images/27.png',2,6,'Vodka'),
(28,'Cassis Tini',5,'2 parts vodka ½ parts blackcurrant liqueur 2½ parts cranberry juice ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice pour cranberry juice blackcurrant liqueur vodka into the\r\n shaker shake well strain into the cocktail glass garnish with berries','/images/28.png',1,1,'Vodka'),
(29,'Crantini',3,'2 parts vodka 2 parts cranberry juice ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice pour cranberry juice vodka into the shaker shake \r\nwell strain into the cocktail glass garnish with cranberries','/images/29.png',2,6,'Vodka'),
(30,'French Cosmo',3,'1½ parts vodka\r\n½ parts blackcurrant liqueur\r\n3 parts pineapple juice\r\n ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice cubes\r\npour pineapple juice blackcurrant liqueur vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/30.png',1,2,'Vodka'),
(31,'Poolside Passion',3,'4 pieces lemon\r\n2 pieces strawberry\r\n1½ parts sugar syrup\r\n2 parts vodka\r\n1 splash cranberry juice\r\n ice',4,1,'red/orange/pink','','add sugar syrup strawberry lemon to the shaker\r\ncrush sugar syrup strawberrylemon with muddler\r\nadd ice to the shaker\r\nadd vodka cranberry juice to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with strawberry','/images/31.png',2,5,'Vodka'),
(32,'Red Rooster',3,'1½ parts vodka\r\n2 parts orange juice\r\n3 parts cranberry juice\r\n ice cubes',4,1,'red/orange/pink','','fill up the shaker with ice\r\npour cranberry juice orange juice vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/32.png',1,2,'Vodka'),
(33,'Showbiz',5,'2 parts vodka\r\n½ parts blackcurrant liqueur\r\n1 part grapefruit juice\r\n ice cubes',8,0,'red/orange/pink','','fill up the shaker with ice\r\npour grapefruit juice blackcurrant liqueur vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/33.png',2,6,'Vodka'),
(34,'Strawberry Martini',5,'2 parts vodka\r\n½ parts grenadine\r\n½ parts lime juice\r\n3 pieces strawberry\r\n crushed ice',8,1,'red/orange/pink','','add crushed ice to the blender\r\npour strawberry lime juice grenadine vodka into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with strawberry','/images/34.png',1,2,'Vodka'),
(35,'Dirty Martini',5,'3 parts vodka\r\n½ parts dry vermouth\r\n½ parts olive juice\r\n ice',8,0,'other','','add ice to the mixer glass\r\npour vodka olive juice dry vermouth into the mixer glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with olives','/images/35.png',1,2,'Vodka'),
(36,'Soviet',3,'1 part dry vermouth\r\n4 parts vodka\r\n1 part sherry\r\n1 dash lemon juice\r\n ice cubes',8,1,'other','','fill up the shaker with ice cubes\r\nstrain into the glass  glass\r\nshake well\r\nstrain into the','/images/36.png',1,2,'Vodka'),
(37,'Eggnog Martini',5,'1 part eggnog\r\n1 part vodka\r\n1 part Amaretto\r\n crushed ice',8,0,'other','','fill up the shaker with crushed ice\r\npour Amaretto vodka eggnog into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/37.png',2,1,'Vodka'),
(39,'Lemon Drop Martini',5,'1¼ parts citrus vodka\r\n1 part Triple sec\r\n¾ parts lemon juice',8,1,'other','','garnish with sugar rim\r\nadd lemon juice citrus vodka Triple secice cubes to the shaker\r\nshake well\r\nstrain into the glass','/images/39.png',1,2,'Vodka'),
(40,'Firestarter',5,'2 parts vodka\r\n1½ parts Cointreau\r\n1½ parts peach schnapps\r\n1½ parts Sloe gin\r\n2 parts cola\r\n ice',4,0,'brown','','fill up the collins glass with ice\r\npour vodka peach schnapps cola Sloe gin Cointreau into the glass\r\ngarnish with lime wedge','/images/40.png',2,1,'Vodka'),
(41,'Summer Sunset',5,'3 parts vodka\r\n1 splash Triple sec\r\n1 splash pomegranate juice\r\n½ pieces lemon\r\n ice\r\n',4,0,'red/orange/pink','','add ice to the shaker\r\nadd vodka pomegranate juice Triple sec to the shaker\r\nshake well\r\nstrain into the snifter glass\r\ngarnish with cinnamon stick','/images/41.png',1,5,'Vodka'),
(42,'Kamikaze',5,'¾ parts vodka\r\n¾ parts Triple sec\r\n¾ parts lime juice\r\n ice cubes',5,0,'other','','fill up the shaker with ice\r\npour lime juice Triple sec vodka into the shaker\r\nshake well\r\nstrain into the shot glass','/images/42.png',1,1,'Vodka'),
(43,'Amarena Chupito',5,'1 part vodka\r\n1 piece cherry',5,0,'other','','pour vodka into the shot glass\r\ngarnish with cocktail cherry','/images/43.png',2,1,'Vodka'),
(44,'Strawberry Vodka Shooter',3,'½ parts vodka\r\n½ parts lemon juice\r\n½ parts strawberry syrup\r\n ice',5,1,'red/orange/pink','','add ice to the shaker\r\nadd vodka strawberry syrup lemon juice to the shaker\r\nshake well\r\nstrain into the shot glass','/images/44.png',2,5,'Vodka'),
(45,'Zambodian',5,'½ parts vodka\r\n½ parts brandy\r\n½ parts pineapple juice\r\n ice',5,0,'red/orange/pink','','add ice to the shaker\r\npour vodka pineapple juice brandy into the shaker\r\nshake well\r\nstrain into the shot glass','/images/45.png',2,1,'Vodka'),
(46,'Blue Kamikaze',5,'1½ parts vodka\r\n1½ parts Blue Curacao\r\n1½ parts lime juice\r\n ice cubes\r\n',4,1,'blue/green','','fill up the shaker with ice\r\npour vodka lime juice Blue Curacao into the shaker\r\nshake well\r\nstrain into the collins glass','/images/46.png',1,2,'Vodka'),
(47,'Blue Lagoon',5,'2 parts vodka\r\n1 part Blue Curacao\r\n1 tbsp lemon juice\r\n3 parts water\r\n ice cubes',4,1,'blue/green','','add ice to the collins glass\r\npour vodka Blue Curacao into the glass\r\nfill up the glass with waterlemon juice\r\nstir together\r\ngarnish with cocktail cherry  orange wedge','/images/47.png',1,1,'Vodka'),
(48,'Sea Bottom',3,'2 parts vodka\r\n2 parts irish cream\r\n2 parts Blue Curacao\r\n3 parts cola\r\n ice cubes',4,1,'blue/green','','add ice to the collins glass\r\npour vodka irish cream into the glass\r\nfill up the glass with cola\r\nadd Blue Curacao to the glass\r\ngarnish with','/images/48.png',1,2,'Vodka'),
(49,'Green Parrot',5,'1½ parts vodka\r\n1½ parts white rum\r\n1 tsp coconut rum\r\n2 tsp dry vermouth\r\n2 tsp Blue Curacao\r\n2 tsp Crème de Cacao\r\n1 splash orange juice\r\n ice cubes',4,1,'other','','fill up the shaker with ice cubes\r\nadd white rumvodka orange juicedry vermouth coconut rum Crème de Cacao Blue Curacao \r\nto the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with mint leaves','/images/49.png',2,5,'Vodka'),
(50,'Amf',3,'½ parts vodka\r\n½ parts white rum\r\n½ parts tequila\r\n½ parts gin\r\n½ parts Blue Curacao\r\n2 parts 7up\r\n2 parts sweet & sour mix\r\n ice cubes',4,1,'blue/green','','fill up the glass with ice cubes\r\nfill up the shaker with ice cubes\r\npour lemon juice sugar syrup Blue Curacao gin tequila white rum vodka into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with cocktail cherry  lemon wheel','/images/50.png',2,6,'Vodka'),
(51,'Sex on the Beach',5,'2 parts vodka\r\n1 part peach schnapps\r\n1 dash grenadine\r\n2 parts orange juice\r\n2 parts cranberry juice\r\n crushed ice',1,0,'red/orange/pink','','fill up the collins glass with ice cubes\r\npour peach schnapps vodka into the glass\r\nfill up the glass with cranberry juice orange juice\r\nadd grenadine to the glass\r\ngarnish with orange wedge','/images/51.png',1,2,'Vodka'),
(52,'Jingle Juice',3,'1 part vodka\r\n1 part Triple sec\r\n1 part lemon juice\r\n1 dash grenadine\r\n4 parts orange juice\r\n ice cubes',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour orange juice lemon juice Triple sec vodka into the glass\r\nstir together\r\npour grenadine into the glass','/images/52.png',1,1,'Vodka'),
(53,'Valentines Day on the Rocks',3,'1 part vodka\r\n1 part cherry brandy\r\n1 dash grenadine\r\n4 parts ginger ale\r\n ice cubes',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour grenadine cherry brandy vodka into the glass\r\nfill up the glass with ginger ale\r\nstir together\r\ngarnish with cocktail cherry','/images/53.png',2,5,'Vodka'),
(54,'Woo Woo',3,'1 part vodka\r\n½ parts peach schnapps\r\n4 parts cranberry juice\r\n ice cubes\r\n',4,0,'red/orange/pink','','fill up the collins glass with ice\r\npour cranberry juice peach schnapps vodka into the glass\r\nstir together\r\ngarnish with orange wheel','/images/54.png',2,6,'Vodka'),
(55,'Purple Passion',3,'2 parts vodka\r\n½ parts sugar syrup\r\n2 parts grapefruit juice\r\n2 parts apple juice\r\n ice cubes',4,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour apple juice grapefruit juice sugar syrup vodka into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with cocktail cherry','/images/55.png',1,2,'Vodka'),
(56,'Mudslide',5,'1½ parts vodka\r\n1½ parts coffee liqueur\r\n1½ parts irish cream\r\n ice cubes',1,1,'brown','','add ice cubes to the shaker\r\npour vodka irish cream coffee liqueur into the shaker\r\nshake well\r\nfill up the old fashioned glass with ice\r\nstrain into the glass','/images/56.png',2,1,'Vodka'),
(57,'Colorado Bulldog',5,'1½ parts vodka\r\n1½ parts coffee liqueur\r\n1 part milk\r\n1 part cola\r\n ice',1,0,'brown','','fill up the old fashioned glass with ice\r\npour vodka coffee liqueur into the glass\r\nadd milkcola to the glass','/images/57.png',1,5,'Vodka'),
(58,'White Russian',4,'2½ parts vodka\r\n1 part coffee liqueur\r\n1½ parts half & half\r\n ice cubes',1,0,'brown','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour coffee liqueur vodka into the shaker\r\nshake well\r\nstrain into the glass\r\ngently layer the half & half','/images/58.png',2,5,'Vodka'),
(59,'Bourbon Ball',4,'1½ parts Bourbon\r\n1 part half & half\r\n½ parts Amaretto\r\n½ parts White Crème de Cacao\r\n ice cubes',8,1,'brown','','fill up the shaker with ice\r\npour whiskey White Crème de Cacao Amaretto half & half into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/59.png',1,1,'Whiskey'),
(60,'Bourbon Chain Toddy',5,'1½ parts whiskey\r\n¾ parts Cointreau\r\n1½ parts chai tea\r\n1 splash Peychaud\'s Bitters\r\n1 tsp honey',1,0,'brown','','pour chai tea into the cocktail glass\r\nadd whiskey honey Peychaud\'s Bitters Cointreau to the glass\r\nstir together\r\ngarnish with orange peel','/images/60.png',2,6,'Whiskey'),
(61,'Dubliner',5,'1 part irish whiskey\r\n1 part Irish Mist\r\n whipped cream\r\n ice cubes',1,1,'red/orange/pink','','fill up the mixer glass with ice\r\npour Irish Mistirish whiskey into the glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with whipped cream','/images/61.png',1,2,'Whiskey'),
(62,'Jack Frost Manhattan',5,'2 parts Bourbon\r\n1 part peppermint schnapps\r\n1 part sweet vermouth\r\n ice cubes',8,0,'brown','','fill up the shaker with ice\r\npour whiskey sweet vermouth peppermint schnapps into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/62.png',2,6,'Whiskey'),
(63,'Paddys Girl',5,'1 part irish whiskey\r\n1 part irish cream\r\n1 part Crème de Cacao\r\n1 part coffee\r\n ice cubes',1,1,'brown','','add crushed ice to the blender\r\npour coffee Crème de Cacao irish cream irish whiskey into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with ground chocolate','/images/63.png',1,2,'Whiskey'),
(64,'The Classic Rob Roy',5,'2¼ parts Scotch\r\n1¼ parts sweet vermouth\r\n1 dash angostura\r\n ice cubes\r\n',5,0,'red/orange/pink','','fill up the shaker with ice cubes\r\npour sweet vermouth angostura Scotch into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/64.png',2,6,'Whiskey'),
(65,'Everybodys Irish',5,'2 parts irish whiskey\r\n1 tsp mint liqueur\r\n1 tsp Chartreuse\r\n ice cubes',8,1,'other','','fill up the shaker with ice\r\npour Chartreuse mint liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with olives','/images/65.png',1,2,'Whiskey'),
(66,'La Louisiane',5,'1 part canadian whisky\r\n1 part Benedictine\r\n1 part sweet vermouth\r\n1 dash absinthe\r\n1 dash angostura\r\n ice\r\n',8,0,'red/orange/pink','','fill up the shaker with ice\r\npour sweet vermouth canadian whisky angostura absinthe Benedictine into the shaker\r\nshake well\r\npour sweet vermouth canadian whisky angostura absinthe Benedictine into the cocktail glass\r\ngarnish with cocktail cherry\r\nstrain into the glass','/images/66.png',2,6,'Whiskey'),
(67,'Egg-nog',4,'3 parts Bourbon\r\n2 parts milk\r\n1 pinch sugar\r\n½ pinches salt\r\n1 tsp vanilla extract\r\n1 piece egg\r\n ice cubes',1,0,'other','','fill up the shaker with ice cubes\r\nadd Bourbon vanilla extract sugar salt milk egg to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cinnamon stick','/images/67.png',1,2,'Whiskey'),
(68,'Rye and Ginger',4,'3 parts canadian whisky\r\n6 parts ginger ale\r\n ice cubes',4,1,'brown','','pour whiskey into the collins glass\r\nadd ice cubes to the glass\r\nfill up the glass with ginger ale','/images/68.png',2,5,'Whiskey'),
(69,'Kerry Cooler',4,'2 parts irish whiskey\r\n1½ parts sherry\r\n1 part oregat syrup\r\n½ parts lemon juice\r\n1 part club soda\r\n ice cubes',4,1,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice oregat syrup sherry irish whiskey into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with orange wheel','/images/69.png',1,1,'Whiskey'),
(70,'Red Snapper',4,'1 part canadian whisky\r\n1 part Amaretto\r\n2 parts cranberry juice\r\n1 part whiskey',4,0,'red/orange/pink','','fill up the shaker with ice\r\npour cranberry juice Amaretto canadian whisky into the shaker\r\nshake well\r\nstrain into the shot glass','/images/70.png',2,1,'Whiskey'),
(71,'CC Express',4,'1¾ parts whiskey\r\n1 part honey\r\n1 part lemon juice\r\n1 part pilsner\r\n ice',1,0,'red/orange/pink','','add whiskey lemon juice honey to the collins glass\r\nstir together\r\nadd ice to the glass\r\nfill up the glass with pilsner\r\nstir together\r\ngarnish with lemon wedge','/images/71.png',1,1,'Whiskey'),
(72,'Irish Coffee',4,'2 parts irish whiskey\r\n1 tsp brown sugar\r\n4½ parts coffee\r\n1½ parts cream',1,1,'brown','','pour whiskey into the irish coffee glass\r\nadd brown sugar to the glass\r\nfill up the glass with coffee\r\ngently layer the cream\r\nuse the back of a teaspoon to separate layers when pouring','/images/72.png',2,1,'Whiskey'),
(73,'Blizzard',4,'2 parts whiskey\r\n¾ parts hazelnut liqueur\r\n¾ parts irish cream\r\n1 cup coffee\r\n ice\r\n',1,1,'brown','','add irish cream whiskey hazelnut liqueur to the irish coffee glass\r\npour coffee into the glass','/images/73.png',1,1,'Whiskey'),
(74,'Merry Irishman',5,'2 parts irish whiskey\r\n1 part coffee liqueur\r\n½ parts mint liqueur\r\n ice cubes',5,0,'brown','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour mint liqueur coffee liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass','/images/74.png',2,6,'Whiskey'),
(75,'Irish Shillelagh',5,'1½ parts irish whiskey\r\n½ parts Sloe gin\r\n1 tsp white rum\r\n1 tsp peach schnapps\r\n1 tsp sugar syrup\r\n1 tsp lemon juice\r\n1 tsp gold rum\r\n1 tsp dark rum\r\n ice cubes',5,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice sugar syrup peach schnapps white rum Sloe gin irish \r\nwhiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with cocktail cherry','/images/75.png',1,2,'Whiskey'),
(76,'Irish Canadian Sangree',4,'½ parts Irish Mist\r\n1 part canadian whisky\r\n½ parts lemon juice\r\n½ parts orange juice\r\n ice cubes',5,0,'red/orange/pink','','fill up the old fashioned glass with ice\r\npour orange juice lemon juice canadian whisky Irish Mist into the glass\r\nstir together\r\ngarnish with ground nutmeg','/images/76.png',2,5,'Whiskey'),
(77,'Old Fashioned',4,'1 dash angostura\r\n2 parts whiskey\r\n1 splash club soda\r\n1 sugar cube\r\n ice cubes\r\n',5,0,'red/orange/pink','','add sugar cube to the old fashioned glass\r\npour club sodaa ngostura into the glass\r\nstir together\r\nfill up the glass with ice cubes\r\nadd whiskey to the glass\r\ngarnish with cocktail cherry  orange wedge','/images/77.png',1,2,'Whiskey'),
(78,'Irish Eyes',4,'1 part irish whiskey\r\n1 dash mint liqueur\r\n2 parts half & half\r\n ice cubes',1,0,'other','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour half & half mint liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with cocktail cherry','/images/78.png',2,5,'Whiskey'),
(79,'Washington Apple',4,'½ parts canadian whisky\r\n½ parts apple schnapps\r\n½ parts cranberry juice',5,1,'red/orange/pink','','fill up the shaker with ice\r\npour cranberry juice apple schnapps canadian whisky into the shaker\r\nshake well\r\nstrain into the shot glass','/images/79.png',1,5,'Whiskey'),
(80,'Three Wise Men',5,'½ parts Scotch\r\n½ parts whiskey\r\n½ parts irish whiskey',5,0,'brown','','pour irish whiskey Bourbon Scotch into the shot glass','/images/80.png',2,1,'Whiskey'),
(81,'Snow Cap',4,'3 parts half & half\r\n2 parts whiskey\r\n1½ parts Triple sec\r\n1½ parts sugar syrup\r\n ice cubes',1,1,'other','','fill up the shaker with ice\r\npour sugar syrup Triple secB ourbonhalf & half into the shaker\r\nshake well\r\nstrain into the snifter glass','/images/81.png',2,5,'Whiskey'),
(82,'Musoka Maple Splash',4,'10 pieces mint leaves\r\n2¼ parts whiskey\r\n¾ parts maple syrup\r\n¾ parts lemon juice\r\n5 pieces peach\r\n1 part club soda\r\n ice',1,1,'other','','add whiskey peachmint leaves lemon juice maple syrup ice to the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\npour club soda into the glass\r\ngarnish with mint leaves','/images/82.png',1,1,'Whiskey'),
(83,'The Classic Mamie Taylor',4,'¾ parts lime juice\r\n3 parts Scotch\r\n6 parts ginger beer\r\n ice',1,1,'other','','add lime juice Scotch to the sour glass\r\npour ginger beer into the glass\r\ngarnish with lime wedge','/images/83.png',2,1,'Whiskey'),
(84,'The Countess',4,'1½ parts tequila\r\n3 parts orange juice\r\n1 dash grenadine\r\n¼ parts lime juice\r\n ice\r\n',4,1,'red/orange/pink','','fill up the shaker with ice\r\nadd tequila orange juice to the shaker\r\nshake well\r\nstrain into the champagne glass\r\npour grenadine into the glass\r\nadd lime juice to the shaker\r\ngarnish with orange wedge','/images/84.png',1,2,'Tequila'),
(85,'Blue Margarita',5,'½ tsp salt\r\n3 parts tequila\r\n1½ parts Triple sec\r\n1½ parts lime juice\r\n1½ parts Blue Curacao\r\n1 tsp sugar\r\n ice cubes\r\n',8,1,'blue/green','','add ice to the shaker\r\nadd tequila salt sugar lime juice Triple sec Blue Curacao to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lime wedges','/images/85.png',1,5,'Tequila'),
(86,'Tequila',5,'2¼ parts tequila\r\n¾ parts Crème de Cacao\r\n¾ parts Blue Curacao\r\n¾ parts cream\r\n ice',1,1,'blue/green','','add ice to the cocktail glass\r\npour tequila cream Crème de Cacao Blue Curacao into the glass\r\nstir together\r\ngarnish with cocktail cherry','/images/86.png',2,6,'Tequila'),
(87,'Honeydew Margarita',4,'1½ parts honeydew melon\r\n2 parts tequila\r\n1½ parts Triple sec\r\n1 part lime juice\r\n¾ parts sugar syrup\r\n ice cubes',8,0,'other','','crush honeydew melon with blender\r\nadd ice to the shaker\r\nadd tequila sugar syruplime juice honeydew melon Triple sec to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lime slice','/images/87.png',1,1,'Tequila'),
(88,'Margarita',5,'1¾ parts tequila\r\n1 part Cointreau\r\n¾ parts lime juice\r\n ice cubes',8,1,'other','','garnish with salt rim\r\nfill up the shaker with ice cubes\r\npour lime juice Cointreau tequila into the shaker\r\nshake well\r\nstrain into the glass\r\ngarnish with lime wedge','/images/88.png',2,1,'Tequila'),
(89,'Agave Kiss',4,'2 parts tequila\r\n1 part black raspberry liqueur\r\n1 part White Crème de Cacao\r\n1 part half & half\r\n ice cubes',1,1,'red/orange/pink','','fill up the shaker with ice\r\npour half & half White Crème de Cacao black raspberry liqueur tequila into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with berries','/images/89.png',1,2,'Tequila'),
(90,'Pink Margarita',5,'2 parts tequila\r\n½ parts campari\r\n¾ parts lemon juice\r\n¾ parts honey\r\n ice cubes',1,1,'red/orange/pink','','add ice to the shaker\r\nadd tequila lemon juice honey campari to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lime slice  mint leaves','/images/90.png',2,5,'Tequila'),
(91,'Mexicano',4,'2 parts tequila\r\n1 tsp grenadine\r\n½ parts lemon juice\r\n1 part pineapple juice\r\n ice cubes\r\n',8,1,'red/orange/pink','','fill up the shaker with ice\r\npour pineapple juice lemon juice grenadine tequila into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/91.png',1,2,'Tequila'),
(92,'Watermelon Margarita',4,'2 cups watermelon\r\n¾ cups tequila\r\n¼ cups Triple sec\r\n1 tbsp sugar\r\n2 tbsp lime juice\r\n ice',1,0,'red/orange/pink','','add watermelon tequilasugar lime juice Triple sec to the blender\r\nblend together\r\nadd ice to the blender\r\nblend together','/images/92.png',2,1,'Tequila'),
(93,'California Dream',5,'½ parts dry vermouth\r\n2 parts tequila\r\n1 part sweet vermouth\r\n ice cubes',8,1,'other','','fill up the shaker with ice\r\npour sweet vermouth tequila dry vermouth into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/93.png',1,2,'Tequila'),
(94,'Viva Villa',4,'2 parts tequila\r\n1 part sugar syrup\r\n1 part lime juice\r\n1 part lemon juice\r\n ice cubes',8,1,'other','','garnish with sugar rim\r\nfill up the shaker with ice\r\npour lemon juicelime juice sugar syrup tequila into the shaker\r\nshake well\r\nstrain into the glass','/images/94.png',2,6,'Tequila'),
(95,'Border Crossing',4,'2 parts tequila\r\n½ parts lime juice\r\n½ parts lemon juice\r\n4 parts cola\r\n ice cubes',4,0,'brown','','fill up the collins glass with ice\r\npour lemon juice lime juice tequila into the glass\r\nstir together\r\nfill up the glass with cola\r\ngarnish with lime wedge','/images/95.png',1,2,'Tequila'),
(96,'Florida Sunshine',5,'2 parts tequila\r\n½ parts grenadine\r\n2 parts orange juice\r\n2 parts pineapple juice\r\n ice cubes',4,0,'red/orange/pink','','fill up the collins glass with ice\r\npour pineapple juice orange juice tequila into the glass\r\nstir together\r\npour grenadine into the glass\r\ngarnish with cocktail cherry','/images/96.png',2,1,'Tequila'),
(97,'Tequila Sunrise',4,'2¼ parts tequila\r\n¾ parts grenadine\r\n4½ parts orange juice\r\n ice cubes',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour orange juice tequila into the glass\r\nadd grenadine drop by drop\r\ngarnish with cocktail cherry  orange wedge','/images/97.png',1,2,'Tequila'),
(98,'Tequila Sunset',4,'3 parts tequila\r\n1 part brandy\r\n4 parts orange juice\r\n ice cubes',4,0,'red/orange/pink','','fill up the collins glass with ice\r\npour tequila into the glass\r\nfill up the glass with orange juice\r\npour brandy into the glass\r\ngarnish with cocktail cherry','/images/98.png',1,2,'Tequila'),
(99,'Pink Fruit',4,'3 parts tequila\r\n1½ parts lime juice\r\n¾ parts grapefruit juice\r\n¾ parts Triple sec\r\n3 parts Sprite\r\n3 dashes angostura\r\n ice cubes',4,0,'red/orange/pink','','fill up the shaker with ice\r\nadd tequilalime juice grapefruit juice angostura Triple sec to the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with Sprite\r\ngarnish with lime wheel','/images/99.png',1,2,'Tequila'),
(100,'Vampiro',4,'2½ parts tequila\r\n4 parts tomato juice\r\n1½ parts orange juice\r\n½ parts lime juice\r\n1 tsp honey\r\n½ pieces onion\r\n2 pieces chili pepper\r\n3 drops worcester sauce\r\n1 pinch salt\r\n crushed ice',5,1,'red/orange/pink','','add ice to the shaker\r\nadd worcester sauce tomato juice tequila salt orange juice onion lime juice \r\nhoney chili pepper to the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with lime slice','/images/100.png',2,1,'Tequila'),
(101,'Doralto',5,'1 dash angostura\r\n1½ parts tequila\r\n½ parts sugar syrup\r\n½ parts lemon juice\r\n4 parts tonic\r\n crushed ice\r\n ice cubes\r\n',4,0,'other','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice sugar syrup tequila angostura into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with tonic\r\ngarnish with lemon spiral','/images/101.png',1,6,'Tequila'),
(102,'El Dorado',4,'3 parts tequila\r\n2 parts lemon juice\r\n1 tsp honey\r\n ice cubes',4,1,'blue/green','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour honeylemon juice tequila into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with lemon wedge','/images/102.png',2,5,'Tequila'),
(103,'Freddy Fudpucker',4,'2 parts tequila\r\n1 part Galliano\r\n4 parts orange juice\r\n ice cubes\r\n',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour orange juice tequila into the glass\r\nstir together\r\npour Galliano into the glass','/images/103.png',1,1,'Tequila'),
(104,'Poker Face',5,'1½ parts tequila\r\n½ parts Cointreau\r\n4 parts pineapple juice\r\n ice cubes',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour pineapple juice Cointreau tequila into the glass\r\nstir together\r\ngarnish with cocktail cherry  pinapple wedges','/images/104.png',2,6,'Tequila'),
(105,'Ambassador',4,'2 parts tequila\r\n1 dash sugar syrup\r\n3 parts orange juice\r\n ice cubes',4,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour orange juice sugar syrup tequila into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with orange wheel','/images/105.png',1,2,'Tequila'),
(106,'Turtle Time',4,'2 parts tequila\r\n4 parts club soda\r\n½ parts lime juice\r\n6 pieces mint leaves\r\n2 pieces basil\r\n1 tbsp sugar\r\n ice',5,1,'other','','crush sugar mint leaves lime juice basil with muddler\r\nadd tequila to the old fashioned glass\r\nstir together\r\nfill up the glass with club soda\r\nadd ice to the glass\r\ngarnish with mint leaves  lemon wedge','/images/106.png',2,5,'Tequila'),
(107,'Irish Cactus',4,'2 parts irish cream\r\n1 part tequila\r\n ice cubes',1,1,'other','','fill up the old fashioned glass with ice\r\npour tequila irish cream into the glass\r\nstir together','/images/107.png',1,2,'Tequila'),
(108,'El Matador',4,'3 parts tequila\r\n1½ parts lime juice\r\n1 part agave nectar\r\n2 strawberry\r\n4 pieces basil\r\n2 dashes pilsner\r\n ice\r\n',4,1,'red/orange/pink','','garnish with salt rim\r\nadd basil strawberry to the shaker\r\ncrush strawberry basil with muddler  shaker\r\nadd ice tequila lime juice agave nectar to the shaker\r\nshake well\r\nstrain into the glass\r\nfill up the glass with pilsner','/images/108.png',1,2,'Tequila'),
(109,'Fresh Mint Margaritas',4,'6 pieces mint leaves\r\n1 pinch salt\r\n2 parts tequila\r\n2 parts lime juice\r\n½ parts Triple sec\r\n crushed ice',8,0,'other','','add lime juice salt mint leaves to the old fashioned glass\r\ncrush lime juice saltmint leaves with muddler\r\nfill up the glass with ice\r\npour tequilaTriple sec into the glass\r\nstir together\r\ngarnish with mint leaves','/images/109.png',2,1,'Tequila'),
(110,'Blue Tequila',5,'1 part tequila\r\n1 part Blue Curacao',5,1,'blue/green','','pour Blue Curacao into the glass\r\ngently layer the tequila\r\nuse the back of a teaspoon to separate layers when pouring','/images/110.png',1,5,'Tequila'),
(111,'Tequila Slammer',4,'1 part tequila\r\n1 part ginger ale',5,1,'other','','pour ginger aletequila into the shot glass\r\ncover the top of the shot glass with hand, hit it to the counter and drink at once while it\'s fizzing','/images/111.png',2,5,'Tequila'),
(112,'Icebreaker',4,'2 parts tequila\r\n1 dash Triple sec\r\n1 dash grenadine\r\n2 parts grapefruit juice\r\n ice cubes',4,0,'red/orange/pink','','fill up the shaker with ice cubes\r\npour grape fruit juice grenadine Triple sec tequila into the shaker\r\nshake well\r\nstrain into the sour glass','/images/112.png',1,1,'Tequila'),
(113,'Coconut Blue Hawaiian',4,'1 part pineapple juice\r\n2 parts white rum\r\n½ parts Blue Curacao\r\n1 part coconut cream\r\n ice cubes',4,1,'blue/green','','add ice to the blender\r\npour white rumpine apple juice coconut cream Blue Curacao into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/113.png',2,6,'rum'),
(114,'Cuban Almond Cigar',4,'3 parts gold rum\r\n1½ parts Amaretto\r\n1½ parts lime juice',8,0,'red/orange/pink','','fill up the shaker with ice cubes\r\nadd lime juice gold rum Amaretto to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lemon spiral  cinnamon stick','/images/114.png',1,1,'rum'),
(115,'El Presidente',3,'2¼ parts white rum\r\n¾ parts Orange Curacao\r\n1 part dry vermouth\r\n1 dash grenadine\r\n ice cubes\r\n',8,1,'red/orange/pink','','add ice cubes to the shaker\r\npour white rum grenadine dry vermouth Orange Curacao into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with orange peel','/images/115.png',2,1,'rum'),
(116,'add ice cubes to the shaker\r\npour white rumgrenadinedry vermouthOrange Curacao into the shaker\r\nshak',3,'2 cups strawberry\r\n2 tbsp sugar\r\n2 tbsp lime juice\r\n3 parts coconut rum\r\n ice',4,1,'red/orange/pink','','add sugar strawberrylime juice to the blender\r\nblend together\r\nadd coconut rumice to the blender\r\nblend together\r\nstrain into the cocktail glass','/images/116.png',2,5,'rum'),
(117,'Strawberry Daiquiri',4,'2 parts white rum\r\n1 part sugar syrup\r\n1 part lime juice\r\n4 pieces strawberry\r\n ice cubes',5,0,'red/orange/pink','','add ice to the blender\r\npour strawberry lime juice sugar syrup white rum into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with strawberry','/images/117.png',1,2,'rum'),
(118,'Bacardi',3,'2¼ parts white rum\r\n1 part lime juice\r\n¼ parts grenadine\r\n ice cubes',1,1,'red/orange/pink','','fill up the shaker with ice cubes\r\npour grenadine lime juice white rum into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/118.png',2,2,'rum'),
(119,'Mary Pickford',4,'2 parts white rum\r\n½ parts Maraschino liqueur\r\n2 parts pineapple juice\r\n½ parts grenadine\r\n ice cubes',1,0,'red/orange/pink','','add ice to the shaker\r\npour white rump ineapple juice grenadine Maraschino liqueur into the shaker\r\nshake well\r\nadd ice to the cocktail glass\r\nstrain into the glass\r\ngarnish with cocktail cherry','/images/119.png',2,1,'rum'),
(120,'Daiquiri',4,'2¼ parts white rum\r\n¼ parts sugar syrup\r\n1 part lime juice\r\n ice cubes\r\n',4,1,'other','','fill up the shaker with ice\r\npour lime juice sugar syrup white rum into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lime slice','/images/120.png',2,6,'rum'),
(121,'Blue Long Island',3,'1½ parts vodka\r\n1½ parts gin\r\n1½ parts white rum\r\n1½ parts tequila\r\n1½ parts Blue Curacao\r\n7½ parts sweet & sour mix\r\n ice',1,1,'blue/green','','fill up the collins glass with ice\r\npour white rum vodka tequilagin into the glass\r\nadd sweet & sour mix to the glass\r\nadd Blue Curacao to the glass\r\ngarnish with lemon wedge','/images/121.png',1,6,'rum'),
(122,'Cuba Libre',4,'2½ parts white rum\r\n½ parts lime juice\r\n6 parts cola\r\n ice cubes',1,1,'brown','','fill up the collins glass with ice\r\npour lime juice white rum into the glass\r\nfill up the glass with cola\r\ngarnish with lime wedge','/images/122.png',2,5,'rum'),
(123,'Long Island Ice Tea',4,'¾ parts gin\r\n1 part white rum\r\n¾ parts tequila\r\n¾ parts Triple sec\r\n¾ parts vodka\r\n1½ parts sugar syrup\r\n1¼ parts lemon juice\r\n1 dash cola\r\n ice cubes',4,1,'brown','','fill up the collins glass with ice cubes\r\npour sugar syrup lemon juice gin Triple sec white rum vodka tequila into the glass\r\nstir together\r\nfill up the glass with cola\r\ngarnish with lemon wedge','/images/123.png',1,2,'rum'),
(124,'Muddy Water',5,'2 parts white rum\r\n4 parts cola\r\n2 parts orange juice\r\n ice cubes',4,0,'brown','','2 parts white rum\r\n4 parts cola\r\n2 parts orange juice\r\n ice cubes','/images/124.png',2,1,'rum'),
(125,'Barracuda',4,'2¼ parts gold rum\r\n¾ parts Galliano\r\n3 parts pineapple juice\r\n1 dash lime juice\r\n1 part prosecco',4,1,'red/orange/pink','','pour pineapple juice lime juice gold rum Galliano into the collins glass\r\nstir together\r\nfill up the glass with prosecco\r\ngarnish with cocktail cherry','/images/125.png',1,2,'rum'),
(126,'Brass Monkey',4,'1½ parts white rum\r\n1½ parts vodka\r\n3 parts orange juice',4,0,'red/orange/pink','','fill up the collins glass with ice\r\npour orange juice vodkawhite rum into the glass\r\nstir together\r\ngarnish with cocktail cherry','/images/126.png',1,1,'rum'),
(127,'Mai Tai',3,'2 parts white rum\r\n1 part dark rum\r\n¾ parts Orange Curacao\r\n¾ parts Amaretto\r\n½ parts lime juice\r\n ice cubes',4,1,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour Amarettolime juice Orange Curacao dark rum white rum into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with lime wheel  mint leaves  pinapple wedges','/images/127.png',1,2,'rum'),
(128,'Mai Tai Light',3,'2 parts white rum\r\n½ parts Triple sec\r\n1 part sugar syrup\r\n2 tsp grenadine\r\n1 part lime juice\r\n2 parts orange juice\r\n ice cubes',1,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour orange juice lime juice grenadine sugar syrup Triple sec white rum into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with cocktail cherry  pinapple wedges','/images/128.png',1,6,'rum'),
(129,'Malibu Beach',3,'2¼ parts coconut rum\r\n4½ parts cranberry juice\r\n4½ parts orange juice\r\n ice',1,0,'red/orange/pink','','add ice to the shaker\r\npour orange juice cranberry juice coconut rum into the shaker\r\nshake well\r\nstrain into the collins glass','/images/129.png',2,5,'rum'),
(130,'Pink Rum',3,'2 parts white rum\r\n1 dash angostura\r\n2 parts cranberry juice\r\n1 part club soda\r\n ice cubes',4,1,'red/orange/pink','','fill up the collins glass with ice\r\npour cranberry juice angostura white rum into the glass\r\nstir together\r\nfill up the glass with club soda\r\ngarnish with lemon spiral','/images/130.png',2,5,'rum'),
(131,'fill up the collins glass with ice\r\npour cranberry juiceangosturawhite rum into the glass\r\nstir toge',3,'1½ parts white rum\r\n1½ parts strawberry liqueur\r\n1 part sugar syrup\r\n1 part lime juice\r\n3 parts club soda\r\n4 pieces mint leaves\r\n ice cubes',4,0,'red/orange/pink','','add sugar syrup mint leaves to the collins glass\r\ncrush sugar syrup mint leaves with muddler\r\nfill up the glass with ice\r\npour lime juice strawberry liqueur white rum into the glass\r\nfill up the glass with club soda\r\nstir together\r\ngarnish with strawberries  lime wedges','/images/131.png',2,6,'rum'),
(132,'Culto a La Vida',3,'3 parts white rum\r\n6 parts cranberry juice\r\n¾ parts lime juice\r\n1 tsp sugar',4,1,'red/orange/pink','','fill up the collins glass with ice cubes\r\nadd sugarlime juice to the glass\r\nstir together\r\npour white rumcranberry juice into the glass','/images/132.png',2,1,'rum'),
(133,'El Nino',3,'4 parts white rum\r\n1½ parts Cointreau\r\n1 part strawberry syrup\r\n3 parts lemon juice\r\n4 pieces strawberry\r\n crushed ice',4,0,'red/orange/pink','','fill up the shaker with ice cubes\r\nadd strawberry to the collins glass\r\ncrush strawberry with muddler\r\nfill up the glass with ice\r\npour white rum strawberry syrup lemon juice Cointreau into the shaker\r\nshake well\r\nstrain into the glass\r\ngarnish with lemon spiral','/images/133.png',1,1,'rum'),
(134,'Havana Raspberry',4,'1½ parts white rum\r\n1 part black raspberry liqueur\r\n2 parts lemon juice\r\n5 pieces raspberry\r\n1 part 7up\r\n ice',4,1,'red/orange/pink','','fill up the shaker with ice cubes\r\nadd raspberry to the shaker\r\ncrush raspberry with muddler\r\npour white rum lemon juice black raspberry liqueur into the shaker\r\nshake well\r\nfill up the collins glass with ice\r\nstrain into the glass\r\nfill up the glass with 7up\r\ngarnish with mint leaves','/images/134.png',1,2,'rum'),
(135,'Angelo Azzurro',4,'3 parts gin\r\n1½ parts Triple sec\r\n½ parts Blue Curacao\r\n ice\r\n',8,1,'blue/green','','add ice to the shaker\r\npour gin Triple sec Blue Curacao into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/135.png',1,1,'gin'),
(136,'Blue Arrow',4,'2 parts gin\r\n1 part Triple sec\r\n1 part Blue Curacao\r\n1 part lime juice\r\n crushed ice',8,1,'blue/green','','fill up the shaker with crushed ice\r\npour lime juice Blue Curacao Triple secgin into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/136.png',2,6,'gin'),
(137,'Blue Bird',4,'2 parts gin\r\n1 part Blue Curacao\r\n1 part lemon juice\r\n1 dash almond syrup\r\n ice',8,1,'blue/green','','add ice cubes to the shaker\r\npour lemon juice gin almond syrup Blue Curacao into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/137.png',2,5,'gin'),
(138,'Angel Face',5,'1½ parts gin\r\n1½ parts apricot brandy\r\n1½ parts Calvados\r\n ice cubes',1,0,'other','','add ice cubes to the shaker\r\npour gin apricot brandy Calvados into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/138.png',1,2,'gin'),
(139,'Derby',5,'3 parts Bourbon\r\n2 drops Orange Bitters\r\n mint leaves\r\n ice cubes',8,1,'other','','add ice cubes to the mixer glass\r\npour Orange Bitters gin into the mixer glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with mint leaves','/images/139.png',1,2,'gin'),
(140,'Emerald Isle',5,'2 parts gin\r\n1 part mint liqueur\r\n3 dashes angostura\r\n ice cubes',8,1,'other','','fill up the shaker with ice\r\npour angostura mint liqueur gin into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/140.png',2,1,'gin'),
(141,'Luigi',4,'2 parts gin\r\n½ parts dry vermouth\r\n1 dash Cointreau\r\n½ parts grenadine\r\n½ parts orange juice\r\n ice cubes',8,1,'red/orange/pink','','fill up the mixer glass with ice cubes\r\npour grenadine orange juice Cointreaudry vermouth gin into the mixer glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with orange peel','/images/141.png',2,5,'gin'),
(142,'Monkey Gland',4,'2 parts gin\r\n1½ parts orange juice\r\n2 drops absinthe\r\n2 drops grenadine',8,1,'red/orange/pink','','fill up the shaker with ice cubes\r\nadd orange juice grenadinegin absinthe to the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/142.png',2,1,'gin'),
(143,'Paradise',3,'1¾ parts gin\r\n1 part apricot brandy\r\n¾ parts orange juice\r\n ice cubes\r\n',1,1,'red/orange/pink','','fill up the shaker with ice cubes\r\npour orange juice gin apricot brandy into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/143.png',1,5,'gin'),
(144,'Clover Club',4,'2¼ parts gin\r\n¾ parts raspberry syrup\r\n¾ parts lemon juice\r\n1 part egg white',1,0,'red/orange/pink','','fill up the shaker with ice cubes\r\nadd raspberry syrup lemon juice gin egg white to the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/144.png',1,2,'gin'),
(145,'Pink Gin',4,'2 parts gin\r\n1 dash angostura\r\n ice cubes',8,1,'red/orange/pink','','fill up the shaker with ice cubes\r\npour angostura gin into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/145.png',1,2,'gin'),
(146,'Pink Lady',4,'2 parts gin\r\n1 part brandy\r\n½ parts lemon juice\r\n2 dashes grenadine\r\n1 part egg white\r\n ice',8,0,'red/orange/pink','','add ice to the shaker\r\npour lemon juice egg white grenadine gin brandy into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/146.png',2,6,'gin'),
(147,'Aviation',4,'2¼ parts gin\r\n¾ parts Maraschino liqueur\r\n¾ parts lemon juice',1,0,'other','','fill up the shaker with ice cubes\r\nadd lemon juice gin Maraschino liqueur to the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/147.png',2,6,'gin'),
(148,'Elderflower Cosmopolitan',4,'2¼ parts gin\r\n¾ parts Elderflower liqueur\r\n6 pieces raspberry\r\n1 part lemon juice\r\n1 tbsp sugar\r\n ice cubes',8,0,'red/orange/pink','','add sugar raspberry lemon juice to the shaker\r\ncrush sugar raspberry lemon juice with muddler\r\nadd gin Elderflower liqueur to the shaker\r\nfill up the shaker with ice cubes\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with orange peel  berries','/images/148.png',2,5,'gin'),
(149,'Silver Autumn Blossom',3,'½ cups cranberry\r\n1½ parts gin\r\n1¼ parts lemon juice\r\n¾ parts sugar syrup\r\n¾ parts aperol\r\n ice\r\n',8,0,'red/orange/pink','','add cranberry to the shaker\r\ncrush cranberry with muddler\r\nfill up the shaker with ice cubes\r\nadd sugar syrup lemon juice gin aperol to the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/149.png',2,6,'gin'),
(150,'The Casino',3,'2 parts gin\r\n½ parts lemon juice\r\n½ parts Maraschino liqueur\r\n½ parts Orange Bitters\r\n ice cubes',1,0,'other','','add ice cubes to the shaker\r\nadd Orange Bitters lemon juice gin Maraschino liqueur to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with lemon spiral  cocktail cherry','/images/150.png',1,2,'gin'),
(151,'Cornell',4,'2 parts gin\r\n½ tbsp lemon juice\r\n1 tsp Maraschino liqueur\r\n1 part egg white\r\n ice',1,1,'other','','add ice to the shaker\r\npour lemon juice egg white gin Maraschino liqueur into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/151.png',1,1,'gin'),
(152,'Knockout',4,'1 tsp mint liqueur\r\n2 parts absinthe\r\n2 parts gin\r\n2 parts dry vermouth',8,1,'other','','ill up the shaker with ice cubes\r\nadd mint liqueur gin dry vermouth absinthe to the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/152.png',2,5,'gin'),
(153,'Montgomery',4,'3 parts gin\r\n1 tsp dry vermouth\r\n ice',8,1,'other','','fill up the shaker with ice\r\nadd gin dry vermouth to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with olives','/images/153.png',1,2,'gin'),
(154,'Cubata',4,'4½ parts gin\r\n1 part lime juice\r\n3 parts cola\r\n ice cubes',4,0,'brown','','add lime juice gin to the shaker\r\nshake well\r\nfill up the collins glass with ice\r\nfill up the glass with cola','/images/154.png',1,2,'gin'),
(155,'Filur',3,'1½ parts grenadine\r\n3 parts gin\r\n5 parts orange juice\r\n ice',4,0,'red/orange/pink','','fill up the collins glass with ice\r\npour orange juice gin into the glass\r\npour grenadine into the glass','/images/155.png',2,5,'gin'),
(156,'Alabama Slammer',4,'1 part gin\r\n1 part Amaretto\r\n1 part Southern Comfort\r\n3 parts orange juice',4,1,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour orange juice Southern Comfort Amarettogin into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with cocktail cherry','/images/156.png',1,2,'gin'),
(157,'Bird Of Paradise',4,'3 parts gin\r\n1½ parts lemon juice\r\n1 tsp sugar\r\n1 tsp grenadine\r\n1 part club soda\r\n ice cubes',4,0,'red/orange/pink','','add ice to the shaker\r\nadd sugar lemon juice grenadine gin to the shaker\r\nshake well\r\nadd ice to the collins glass\r\nstrain into the glass\r\nfill up the glass with club soda','/images/157.png',2,5,'gin'),
(158,'Gina',3,'2 parts gin\r\n1 part blackcurrant liqueur\r\n½ parts lemon juice\r\n2 parts club soda\r\n ice cubes',4,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice black currant liqueur gin into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with berries','/images/158.png',1,6,'gin'),
(159,'Collins',3,'2¼ parts gin\r\n¾ parts sugar syrup\r\n1½ parts lemon juice\r\n3 parts club soda\r\n1 dash angostura\r\n ice cubes',1,0,'other','','fill up the collins glass with ice\r\npour lemon juice sugar syrup gin into the glass\r\nstir together\r\nfill up the glass with club soda\r\nadd angostura drop by drop\r\ngarnish with cocktail cherry  lime wedge','/images/159.png',1,2,'gin'),
(160,'Gin Fizz',3,'2¼ parts gin\r\n1 dash sugar syrup\r\n1½ parts lemon juice\r\n4 parts club soda\r\n ice cubes\r\n',4,1,'other','','fill up the shaker with ice cubes\r\npour lemon juice sugar syrupgin into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with lemon wheel','/images/160.png',1,2,'gin'),
(161,'Gin Rickey',3,'2 parts gin\r\n1 part lime juice\r\n4 parts club soda\r\n',8,0,'other','','fill up the collins glass with ice\r\npour lime juice gin into the glass\r\nstir together\r\nfill up the glass with club soda\r\ngarnish with lime wheel','/images/161.png',2,5,'gin'),
(162,'Gin Tonic',3,'2 parts gin\r\n4 parts tonic\r\n ice cubes\r\n',4,0,'other','','fill up the collins glass with ice\r\npour gin into the glass\r\nfill up the glass with tonic\r\nstir together\r\ngarnish with lemon wheel','/images/162.png',2,6,'gin'),
(163,'Lime Gin Fizz',3,'2 parts gin\r\n1 part lime juice\r\n4 parts club soda\r\n ice cubes',4,1,'other','','fill up the collins glass with ice\r\npour gin into the glass\r\npour lime juice into the glass\r\nfill up the glass with club soda\r\ngarnish with lime wedge','/images/163.png',1,2,'gin'),
(164,'Ramos Fizz',3,'2¼ parts gin\r\n¾ parts lime juice\r\n¾ parts lemon juice\r\n1½ parts sugar syrup\r\n3 parts cream\r\n1 part egg white\r\n2 drops vanilla extract\r\n1 part club soda\r\n ice\r\n',1,0,'other','','add vanilla extract sugar syrup lime juice lemon juice gin egg white \r\ncream to the shaker\r\nshake well\r\nadd ice to the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda','/images/164.png',1,2,'gin'),
(165,'Silver Fizz',3,'2 parts gin\r\n1 dash sugar syrup\r\n1 part lemon juice\r\n4 parts club soda\r\n1 part egg white\r\n crushed ice',1,0,'other','','fill up the glass with crushed ice\r\nfill up the shaker with ice cubes\r\npour egg white lemon juice sugar syrup gin into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with lemon wedge','/images/165.png',2,5,'gin'),
(166,'The Fitzgerald',5,'3 parts gin\r\n2 dashes angostura\r\n1 part lemon juice\r\n1 part sugar syrup\r\n ice',5,0,'red/orange/pink','','add ice to the shaker\r\nadd sugar syrup lemon juice gin to the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\nadd angostura to the glass\r\ngarnish with lemon wedge','/images/166.png',1,2,'gin'),
(167,'American Beauty',3,'3 parts gin\r\n1½ parts lemon juice\r\n1 part sugar syrup\r\n3 pieces raspberry\r\n3 pieces blueberry\r\n6 pieces mint leaves\r\n ice',5,1,'red/orange/pink','','add raspberrymint leavesl emon juice blueberry to the shaker\r\ncrush raspberry mint leaves lemon juice blueberry with muddler\r\nadd sugar syrupice gin to the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with lemon spiral','/images/167.png',2,1,'gin'),
(168,'Bermuda Rose',4,'3 parts gin\r\n1 tbsp lime juice\r\n2 tsp apricot brandy\r\n2 tsp grenadine\r\n ice',8,0,'red/orange/pink','','3 parts gin\r\n1 tbsp lime juice\r\n2 tsp apricot brandy\r\n2 tsp grenadine\r\n ice','/images/168.png',2,1,'gin'),
(169,'Gin Daisy',3,'2 parts gin\r\n½ parts grenadine\r\n1 part lemon juice\r\n1 part club soda\r\n crushed ice\r\n ice cubes',4,0,'red/orange/pink','','fill up the glass with ice\r\nfill up the shaker with crushed ice\r\npour lemon juice grenadine gin into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with orange wheel','/images/169.png',2,6,'gin'),
(170,'Bramble',4,'2 parts gin\r\n¾ parts lemon juice\r\n½ parts sugar syrup\r\n¾ parts blackberry liqueur\r\n ice',5,0,'brown','','add ice to the old fashioned glass\r\npour sugar syrup lemon juice gin into the glass\r\nstir together\r\nadd blackberry liqueur drop by drop\r\ngarnish with lime slice','/images/170.png',2,6,'gin'),
(171,'Cardinale',4,'3 parts gin\r\n¾ parts dry vermouth\r\n¾ parts campari\r\n ice',5,1,'red/orange/pink','','fill up the old fashioned glass with ice\r\npour gindry vermouth campari into the glass\r\nstir together','/images/171.png',2,5,'gin'),
(172,'Negroni',5,'1½ parts gin\r\n1½ parts sweet vermouth\r\n1½ parts campari\r\n',5,0,'brown','','fill up the old fashioned glass with ice\r\npour campari sweet vermouth gin into the glass\r\nstir together\r\ngarnish with orange wedge','/images/172.png',1,5,'gin'),
(173,'Flying Dutchman',5,'2 parts gin\r\n½ parts Triple sec\r\n ice cubes',1,0,'other','','fill up the old fashioned glass with ice\r\npour Triple secgin into the glass\r\nstir together\r\ngarnish with lime wedge','/images/173.png',2,5,'gin'),
(174,'Holiday Almond',4,'1 part gin\r\n½ parts Amaretto\r\n1 dash angostura\r\n1 dash lime juice\r\n ice cubes',5,1,'brown','','fill up the snifter glass with ice\r\npour lime juice angostura Amaretto gin into the glass\r\nstir together','/images/174.png',1,2,'gin'),
(175,'Orange Blossom',4,'2 parts gin\r\n½ parts sugar syrup\r\n2 parts orange juice\r\n ice cubes\r\n',4,0,'red/orange/pink','','fill up the shaker with ice\r\npour orange juice sugar syrup gin into the shaker\r\nshake well\r\nstrain into the sour glass\r\ngarnish with orange wheel','/images/175.png',2,2,'gin'),
(176,'Melon Ball',4,'1 part Midori\r\n1 part vodka\r\n½ parts orange juice\r\n ice cubes',5,1,'blue/green','','fill up the shaker with ice\r\npour vodka Midori into the shaker\r\nshake well\r\nstrain into the shot glass\r\nfill up the glass with orange juice','/images/176.png',2,1,'Vodka'),
(177,'Scottish Licorice',3,'1½ parts absinthe\r\n1½ parts hazelnut liqueur\r\n½ parts Scotch',5,1,'blue/green','','pour hazelnut liqueur absinthe Scotch into the cocktail glass\r\nstir together','/images/177.png',2,2,'gin'),
(178,'Shamrock',4,'1½ parts irish whiskey\r\n½ parts dry vermouth\r\n1 tsp mint liqueur\r\n ice cubes',1,1,'blue/green','','fill up the mixer glass with ice\r\npour mint liqueur dry vermouth irish whiskey into the mixer glass\r\nstir together\r\nstrain into the cocktail glass','/images/178.png',1,2,'Whiskey'),
(179,'Vodka Stinger',5,'2 parts vodka\r\n1 part mint liqueur\r\n ice cubes\r\nHOW',5,1,'blue/green','','fill up the old fashioned glass with ice\r\nfill up the shaker with ice cubes\r\npour mint liqueur vodka into the shaker\r\nshake well\r\nstrain into the glass','/images/179.png',1,1,'Vodka'),
(180,'Green Russian',5,'2 parts vodka\r\n1 part mint liqueur\r\n ice cubes',5,1,'blue/green','','fill up the old fashioned glass with ice\r\npour mint liqueur vodka into the glass\r\nstir together\r\ngarnish with mint leaves','/images/180.png',1,6,'Vodka'),
(181,'Caipiroshka',4,'2 parts vodka\r\n3 tbsp sugar\r\n2 lime wedges\r\n crushed ice',1,1,'blue/green','','add sugar lime wedge to the old fashioned glass\r\ncrush sugar lime wedge with muddler\r\nfill up the glass with crushed ice\r\nadd vodka to the glass\r\nstir together','/images/181.png',2,2,'Vodka'),
(182,'Caipirissima',5,'\r\n2 parts white rum\r\n¾ parts sugar syrup\r\n4 lime wedges\r\n crushed ice\r\n',1,1,'blue/green','','fill up the shaker with ice cubes\r\nfill up the old fashioned glass with crushed ice\r\nadd sugar syrup lime wedge to the shaker\r\ncrush sugar syrup lime wedge with muddler\r\npour white rum into the shaker\r\nshake well\r\nstrain into the glass\r\nstir together','/images/182.png',1,5,'rum'),
(191,'Winter Chill',3,'8`2 parts vodka\r\n1 part Blue Curacao\r\n1 part lime juice\r\n1 part Triple sec\r\n ice cubes',8,1,'blue/green','','fill up the shaker with ice\r\npour Triple sec lime juice Blue Curacao vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/191.png',1,6,'Vodka');

/*Table structure for table `favourites` */

DROP TABLE IF EXISTS `favourites`;

CREATE TABLE `favourites` (
  `user` int(11) NOT NULL,
  `cocktail` int(11) NOT NULL,
  PRIMARY KEY (`user`,`cocktail`),
  KEY `cocktail` (`cocktail`),
  CONSTRAINT `favourites_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `favourites_ibfk_4` FOREIGN KEY (`cocktail`) REFERENCES `cocktail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

/*Data for the table `favourites` */

insert  into `favourites`(`user`,`cocktail`) values 
(1,12),
(1,31),
(1,42),
(1,50),
(1,108),
(2,22);

/*Table structure for table `moment` */

DROP TABLE IF EXISTS `moment`;

CREATE TABLE `moment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `moment` */

insert  into `moment`(`id`,`name`) values 
(1,'Company Party/ Family Gatherin'),
(2,'Night Out'),
(5,'Beach/ Barbecue & Picnic'),
(6,'Poolside/ Taking Time for Yourself ');

/*Table structure for table `season` */

DROP TABLE IF EXISTS `season`;

CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `season` */

insert  into `season`(`id`,`name`) values 
(1,'Fall/Winter'),
(2,'Spring/Summer'),
(4,'Winter'),
(5,'All seasons');

/*Table structure for table `strength` */

DROP TABLE IF EXISTS `strength`;

CREATE TABLE `strength` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `strength` */

insert  into `strength`(`id`,`name`) values 
(1,'Nonalcoholic'),
(2,'Weak'),
(3,'Light'),
(4,'Medium'),
(5,'Strong');

/*Table structure for table `style` */

DROP TABLE IF EXISTS `style`;

CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `style` */

insert  into `style`(`id`,`name`) values 
(1,'Classic'),
(4,'Longdrink/Tropical'),
(8,'Martini'),
(5,'Short');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`surname`,`email`,`role`) values 
(1,'milja','$2a$10$CuwDkTuD4zc1x7adyx8NxuwHs7ML5qzHYK7bTha5FC/zVTwEzJK3O','Miljana','Ratkov','m.ratkov995@gmail.com','user'),
(2,'admin','$2a$04$RNs5Xtjo7F3upPGzSbVPTOfEOPkevYQYk96t82l4A47UenCK6l9Ou','Test','Admin','admin@gmail.com','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
