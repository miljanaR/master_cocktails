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
  CONSTRAINT `cocktail_ibfk_2` FOREIGN KEY (`moment`) REFERENCES `season` (`id`),
  CONSTRAINT `cocktail_ibfk_3` FOREIGN KEY (`strength`) REFERENCES `strength` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

/*Data for the table `cocktail` */

insert  into `cocktail`(`id`,`name`,`strength`,`ingredients`,`style`,`price`,`color`,`country`,`mix`,`picture`,`season`,`moment`,`main_ingredient`) values 
(7,'Black and Tan',1,'1/2 pints stout beer 1/2 pints lager\n                     \n                     \n                     \n                     ',3,1,'red','Mexico','00:00:00','/images/7.png',4,1,'Vodka'),
(8,'cocktail 2',1,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',3,1,'blue','Japan','00:00:00','/images/8.png',2,2,'Vodka'),
(9,'cocktail 3',2,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',3,1,'blue','India','00:00:00','/images/9.png',3,3,'Vodka'),
(10,'Espresso Martini',4,'2 parts vodka ½ parts coffee liqueur 1 part sugar syrup 2¼ parts coffee',1,1,'brown','Tunis','00:00:00','/images/10.png',4,4,'Vodka'),
(11,'Ocean View',5,'1½ parts vodka ½ parts dry vermouth ½ parts mint liqueur ½ parts Blue Curacao ice',6,1,'blue','Thailand','00:00:00','/images/11.png',5,5,'Vodka'),
(12,'Chocolate Martini',5,'4 parts vodka 2 parts White Crème de Cacao 1 splash chocolate syrup ice cubes',2,1,'brown','ff','00:00:00','/images/12.png',2,NULL,'Vodka'),
(13,'After Eight Martini',4,'1 part vodka 2 parts irish cream 1 part mint liqueur ice cubes',2,1,'green','','00:00:00','/images/13.png',NULL,NULL,'Vodka'),
(14,'Apple Martini',5,'3 parts vodka 1½ parts apple schnapps 1 part lemon juice ice cubes',8,1,'green','v','00:00:00','/images/14.png',NULL,NULL,'Vodka'),
(15,'Appletini',5,'4 parts vodka 2 parts apple juice ice cubes',8,1,'green','','00:00:00','/images/15.png',NULL,NULL,'Vodka'),
(16,'Candy Cane Martini',5,'3 parts vanilla vodka ½ parts mint liqueur ice cubes',8,1,'green','','fill up the shaker with ice pour mint liqueur vanilla vodka into the shaker shake well strain into the cocktail glass garnish with','/images/16.png',NULL,NULL,'Vodka'),
(17,'Greentini',5,'4 parts vodka 2 parts Midori ice cubes\r\n',8,1,'green','','fill up the shaker with ice pour Midori vodka into the shaker shake well strain into the cocktail glass garnish with lime wedge\r\n','/images/17.png',NULL,NULL,'Vodka'),
(18,'Grinch',4,'4 parts Midori 1 part lemon juice 2 dashes sugar syrup ice cubes\r\n',8,1,'green','','fill up the shaker with ice pour sugar syrup \r\nlemon juice Midori into the shaker \r\nshake well strain into the cocktail glass garnish\r\n with candy stick cocktail cherry','/images/18.png',NULL,NULL,'Vodka'),
(19,'Luckytini',4,'2 parts vodka 1 part Midori 1 part pineapple juice ice cubes',8,1,'green','','fill up the shaker with ice pour pineapple juice Midori vodka into the shaker \r\nshake well strain into the cocktail glass garnish with orange wedge','/images/19.png',2,NULL,'Vodka'),
(20,'Midori Cosmopolitan',4,'1 part Midori 1 part citrus vodka 1 part cranberry juice ½ parts lemon juice ice cubes',8,1,'blue','','fill up the shaker with ice pour lemon juice cranberry juice \r\ncitrus vodka Midori into the shaker shake well strain into the \r\ncocktail glass garnish with raspberry','/images/20.png',2,NULL,'Vodka'),
(21,'Mintini',5,'2 parts vodka 1 part mint liqueur 1 part peppermint schnapps ice cubes',8,1,'blue','','fill up the shaker with ice pour peppermint schnapps mint liqueur vodka\r\n into the shaker shake well strain into the cocktail glass garnish with candy cane','/images/21.png',NULL,NULL,'Vodka'),
(22,'Bikini Martini',4,'1 part coconut rum 1 part vodka 1 part pineapple juice 1 dash grenadine ice cubes',8,1,'orange','','fill up the shaker with ice pour pineapple juice vodka coconut rum into\r\n the shaker shake well strain into the cocktail glass pour grenadine into the glass','/images/22.png',NULL,NULL,'Vodka'),
(23,'Carrie Bradshaw',4,'1? parts vodka ? parts gin ? parts Orange Curacao ? parts sugar syrup 1 part lime juice ? parts cranberry juice 1 dash club soda 2 dashes Peychaud\'s Bitters ice cubes \n                     \n                     ',8,1,'red','','add ice to the shaker pour vodka sugar syrup lime juice Peychaud\'s Bitters gin \ncranberry juice Orange Curacao into \nthe shaker shake well strain into the cocktail glass pour club soda into the glass','/images/23.png',1,2,'Vodka'),
(24,'Cosmopolitan',4,'¾ parts Cointreau 2 parts citrus vodka ¾ parts lime juice 1½ parts cranberry juice ice cubes',8,1,'pink','','fill up the shaker with ice cubes pour vodka cranberry juice lime juice \r\nCointreau into the shaker shake \r\nwell strain into the cocktail glass garnish with orange wedge','/images/24.png',NULL,NULL,'Vodka'),
(25,'French Martini',4,'3 parts vodka 2½ parts pineapple juice ½ parts blackcurrant liqueur ice cubes',8,1,'pink','','fill up the shaker with ice cubes add vodka pineapple juice blackcurrant \r\nliqueur to the shaker shake well strain into the cocktail glass','/images/25.png',NULL,NULL,'Vodka'),
(26,'The Glamour Gal',5,'3 parts vodka ¾ parts lemon juice ¾ parts lime juice ¾ parts sugar syrup 1 drop blackcurrant liqueur ice',8,1,'multicolor','','garnish with sugar rim add ice to the shaker\r\n pour vodka sugar syrup lime juice lemon juice into the shaker shake well \r\nstrain into the\r\n glass add blackcurrant liqueur to the glass','/images/26.png',NULL,NULL,'Vodka'),
(27,'Blueberry Martini',5,'4 parts vodka 1 part blueberry liqueur 1 part water 1 dash sugar syrup ice',8,1,'purple','','add ice cubes to the shaker add water vodka sugar syrup blueberry liqueur to the shaker \r\nshake well strain into the cocktail glass garnish with berries','/images/27.png',NULL,NULL,'Vodka'),
(28,'Cassis Tini',4,'2 parts vodka ½ parts blackcurrant liqueur 2½ parts cranberry juice ice cubes',8,1,'blue','','fill up the shaker with ice pour cranberry juice blackcurrant liqueur vodka into the\r\n shaker shake well strain into the cocktail glass garnish with berries','/images/28.png',NULL,NULL,'Vodka'),
(29,'Crantini',4,'2 parts vodka 2 parts cranberry juice ice cubes',8,1,'red','','fill up the shaker with ice pour cranberry juice vodka into the shaker shake \r\nwell strain into the cocktail glass garnish with cranberries','/images/29.png',NULL,NULL,'Vodka'),
(30,'French Cosmo',3,'1½ parts vodka\r\n½ parts blackcurrant liqueur\r\n3 parts pineapple juice\r\n ice cubes',8,1,'red','','fill up the shaker with ice cubes\r\npour pineapple juice blackcurrant liqueur vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/30.png',NULL,NULL,'Vodka'),
(31,'Poolside Passion',4,'4 pieces lemon\r\n2 pieces strawberry\r\n1½ parts sugar syrup\r\n2 parts vodka\r\n1 splash cranberry juice\r\n ice',6,1,'red','','add sugar syrup strawberry lemon to the shaker\r\ncrush sugar syrup strawberrylemon with muddler\r\nadd ice to the shaker\r\nadd vodka cranberry juice to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with strawberry','/images/31.png',NULL,NULL,'Vodka'),
(32,'Red Rooster',3,'1½ parts vodka\r\n2 parts orange juice\r\n3 parts cranberry juice\r\n ice cubes',4,1,'red','','fill up the shaker with ice\r\npour cranberry juice orange juice vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/32.png',NULL,NULL,'Vodka'),
(33,'Showbiz',4,'2 parts vodka\r\n½ parts blackcurrant liqueur\r\n1 part grapefruit juice\r\n ice cubes',8,1,'pink','','fill up the shaker with ice\r\npour grapefruit juice blackcurrant liqueur vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/33.png',NULL,NULL,'Vodka'),
(34,'Strawberry Martini',4,'2 parts vodka\r\n½ parts grenadine\r\n½ parts lime juice\r\n3 pieces strawberry\r\n crushed ice',8,1,'red','','add crushed ice to the blender\r\npour strawberry lime juice grenadine vodka into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with strawberry','/images/34.png',NULL,NULL,'Vodka'),
(35,'Dirty Martini',5,'3 parts vodka\r\n½ parts dry vermouth\r\n½ parts olive juice\r\n ice',8,0,'clear','','add ice to the mixer glass\r\npour vodka olive juice dry vermouth into the mixer glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with olives','/images/35.png',NULL,NULL,'Vodka'),
(36,'Soviet',5,'1 part dry vermouth\r\n4 parts vodka\r\n1 part sherry\r\n1 dash lemon juice\r\n ice cubes',8,0,'yellow','','fill up the shaker with ice cubes\r\nstrain into the glass  glass\r\nshake well\r\nstrain into the','/images/36.png',NULL,NULL,'Vodka'),
(37,'Eggnog Martini',4,'1 part eggnog\r\n1 part vodka\r\n1 part Amaretto\r\n crushed ice',8,0,'yellow','','fill up the shaker with crushed ice\r\npour Amaretto vodka eggnog into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/37.png',NULL,NULL,'Vodka'),
(38,'White Christmas Dream',4,'1 part vodka\r\n1 part White Crème de Cacao\r\n1 part half & half\r\n ice cubes',2,0,'white','','fill up the shaker with crushed ice\r\npour half & half White Crème de Cacao vodka into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/38.png',NULL,NULL,'Vodka'),
(39,'Lemon Drop Martini',5,'1¼ parts citrus vodka\r\n1 part Triple sec\r\n¾ parts lemon juice',8,0,'yellow','','garnish with sugar rim\r\nadd lemon juice citrus vodka Triple secice cubes to the shaker\r\nshake well\r\nstrain into the glass','/images/39.png',NULL,NULL,'Vodka'),
(40,'Firestarter',5,'2 parts vodka\r\n1½ parts Cointreau\r\n1½ parts peach schnapps\r\n1½ parts Sloe gin\r\n2 parts cola\r\n ice',4,0,'brown','','fill up the collins glass with ice\r\npour vodka peach schnapps cola Sloe gin Cointreau into the glass\r\ngarnish with lime wedge','/images/40.png',NULL,NULL,'Vodka'),
(41,'Summer Sunset',5,'3 parts vodka\r\n1 splash Triple sec\r\n1 splash pomegranate juice\r\n½ pieces lemon\r\n ice\r\n',4,0,'red','','add ice to the shaker\r\nadd vodka pomegranate juice Triple sec to the shaker\r\nshake well\r\nstrain into the snifter glass\r\ngarnish with cinnamon stick','/images/41.png',NULL,NULL,'Vodka'),
(42,'Kamikaze',5,'¾ parts vodka\r\n¾ parts Triple sec\r\n¾ parts lime juice\r\n ice cubes',5,0,'green','','fill up the shaker with ice\r\npour lime juice Triple sec vodka into the shaker\r\nshake well\r\nstrain into the shot glass','/images/42.png',NULL,NULL,'Vodka'),
(43,'Amarena Chupito',5,'1 part vodka\r\n1 piece cherry',5,0,'clear','','pour vodka into the shot glass\r\ngarnish with cocktail cherry','/images/43.png',NULL,NULL,'Vodka'),
(44,'Strawberry Vodka Shooter',4,'½ parts vodka\r\n½ parts lemon juice\r\n½ parts strawberry syrup\r\n ice',5,0,'red','','add ice to the shaker\r\nadd vodka strawberry syrup lemon juice to the shaker\r\nshake well\r\nstrain into the shot glass','/images/44.png',NULL,NULL,'Vodka'),
(45,'Zambodian',5,'½ parts vodka\r\n½ parts brandy\r\n½ parts pineapple juice\r\n ice',5,0,'orange','','add ice to the shaker\r\npour vodka pineapple juice brandy into the shaker\r\nshake well\r\nstrain into the shot glass','/images/45.png',NULL,NULL,'Vodka'),
(46,'Blue Kamikaze',4,'1½ parts vodka\r\n1½ parts Blue Curacao\r\n1½ parts lime juice\r\n ice cubes\r\n',4,0,'blue','','fill up the shaker with ice\r\npour vodka lime juice Blue Curacao into the shaker\r\nshake well\r\nstrain into the collins glass','/images/46.png',NULL,NULL,'Vodka'),
(47,'Blue Lagoon',4,'2 parts vodka\r\n1 part Blue Curacao\r\n1 tbsp lemon juice\r\n3 parts water\r\n ice cubes',6,0,'blue','','add ice to the collins glass\r\npour vodka Blue Curacao into the glass\r\nfill up the glass with waterlemon juice\r\nstir together\r\ngarnish with cocktail cherry  orange wedge','/images/47.png',NULL,NULL,'Vodka'),
(48,'Sea Bottom',3,'2 parts vodka\r\n2 parts irish cream\r\n2 parts Blue Curacao\r\n3 parts cola\r\n ice cubes',4,0,'blue','','add ice to the collins glass\r\npour vodka irish cream into the glass\r\nfill up the glass with cola\r\nadd Blue Curacao to the glass\r\ngarnish with','/images/48.png',NULL,NULL,'Vodka'),
(49,'Green Parrot',4,'1½ parts vodka\r\n1½ parts white rum\r\n1 tsp coconut rum\r\n2 tsp dry vermouth\r\n2 tsp Blue Curacao\r\n2 tsp Crème de Cacao\r\n1 splash orange juice\r\n ice cubes',6,0,'green','','fill up the shaker with ice cubes\r\nadd white rumvodka orange juicedry vermouth coconut rum Crème de Cacao Blue Curacao \r\nto the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with mint leaves','/images/49.png',NULL,NULL,'Vodka'),
(50,'Amf',3,'½ parts vodka\r\n½ parts white rum\r\n½ parts tequila\r\n½ parts gin\r\n½ parts Blue Curacao\r\n2 parts 7up\r\n2 parts sweet & sour mix\r\n ice cubes',4,0,'blue','','fill up the glass with ice cubes\r\nfill up the shaker with ice cubes\r\npour lemon juice sugar syrup Blue Curacao gin tequila white rum vodka into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with cocktail cherry  lemon wheel','/images/50.png',NULL,NULL,'Vodka'),
(51,'Sex on the Beach',4,'2 parts vodka\r\n1 part peach schnapps\r\n1 dash grenadine\r\n2 parts orange juice\r\n2 parts cranberry juice\r\n crushed ice',1,0,'orange','','fill up the collins glass with ice cubes\r\npour peach schnapps vodka into the glass\r\nfill up the glass with cranberry juice orange juice\r\nadd grenadine to the glass\r\ngarnish with orange wedge','/images/51.png',NULL,NULL,'Vodka'),
(52,'Jingle Juice',3,'1 part vodka\r\n1 part Triple sec\r\n1 part lemon juice\r\n1 dash grenadine\r\n4 parts orange juice\r\n ice cubes',4,0,'orange','','fill up the collins glass with ice\r\npour orange juice lemon juice Triple sec vodka into the glass\r\nstir together\r\npour grenadine into the glass','/images/52.png',NULL,NULL,'Vodka'),
(53,'Valentines Day on the Rocks',3,'1 part vodka\r\n1 part cherry brandy\r\n1 dash grenadine\r\n4 parts ginger ale\r\n ice cubes',4,0,'pink','','fill up the collins glass with ice\r\npour grenadine cherry brandy vodka into the glass\r\nfill up the glass with ginger ale\r\nstir together\r\ngarnish with cocktail cherry','/images/53.png',NULL,NULL,'Vodka'),
(54,'Woo Woo',3,'1 part vodka\r\n½ parts peach schnapps\r\n4 parts cranberry juice\r\n ice cubes\r\n',4,0,'pink','','fill up the collins glass with ice\r\npour cranberry juice peach schnapps vodka into the glass\r\nstir together\r\ngarnish with orange wheel','/images/54.png',NULL,NULL,'Vodka'),
(55,'Purple Passion',3,'2 parts vodka\r\n½ parts sugar syrup\r\n2 parts grapefruit juice\r\n2 parts apple juice\r\n ice cubes',4,0,'purple','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour apple juice grapefruit juice sugar syrup vodka into the shaker\r\nshake well\r\nstrain into the collins glass\r\ngarnish with cocktail cherry','/images/55.png',NULL,NULL,'Vodka'),
(56,'Mudslide',5,'1½ parts vodka\r\n1½ parts coffee liqueur\r\n1½ parts irish cream\r\n ice cubes',2,0,'brown','','add ice cubes to the shaker\r\npour vodka irish cream coffee liqueur into the shaker\r\nshake well\r\nfill up the old fashioned glass with ice\r\nstrain into the glass','/images/56.png',NULL,NULL,'Vodka'),
(57,'Colorado Bulldog',3,'1½ parts vodka\r\n1½ parts coffee liqueur\r\n1 part milk\r\n1 part cola\r\n ice',2,0,'brown','','fill up the old fashioned glass with ice\r\npour vodka coffee liqueur into the glass\r\nadd milkcola to the glass','/images/57.png',NULL,NULL,'Vodka'),
(58,'White Russian',4,'2½ parts vodka\r\n1 part coffee liqueur\r\n1½ parts half & half\r\n ice cubes',1,0,'brown','','fill up the glass with ice\r\nfill up the shaker with ice cubes\r\npour coffee liqueur vodka into the shaker\r\nshake well\r\nstrain into the glass\r\ngently layer the half & half','/images/58.png',NULL,NULL,'Vodka'),
(59,'Bourbon Ball',4,'1½ parts Bourbon\r\n1 part half & half\r\n½ parts Amaretto\r\n½ parts White Crème de Cacao\r\n ice cubes',8,0,'brown','','fill up the shaker with ice\r\npour whiskey White Crème de Cacao Amaretto half & half into the shaker\r\nshake well\r\nstrain into the cocktail glass','/images/59.png',NULL,NULL,'Whiskey'),
(60,'Bourbon Chain Toddy',5,'1½ parts whiskey\r\n¾ parts Cointreau\r\n1½ parts chai tea\r\n1 splash Peychaud\'s Bitters\r\n1 tsp honey',1,0,'brown','','pour chai tea into the cocktail glass\r\nadd whiskey honey Peychaud\'s Bitters Cointreau to the glass\r\nstir together\r\ngarnish with orange peel','/images/60.png',NULL,NULL,'Whiskey'),
(61,'Dubliner',5,'1 part irish whiskey\r\n1 part Irish Mist\r\n whipped cream\r\n ice cubes',2,0,'orange','','fill up the mixer glass with ice\r\npour Irish Mistirish whiskey into the glass\r\nstir together\r\nstrain into the cocktail glass\r\ngarnish with whipped cream','/images/61.png',NULL,NULL,'Whiskey'),
(62,'Jack Frost Manhattan',5,'2 parts Bourbon\r\n1 part peppermint schnapps\r\n1 part sweet vermouth\r\n ice cubes',8,0,'brown','','fill up the shaker with ice\r\npour whiskey sweet vermouth peppermint schnapps into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/62.png',NULL,NULL,'Whiskey'),
(63,'Paddys Girl',3,'1 part irish whiskey\r\n1 part irish cream\r\n1 part Crème de Cacao\r\n1 part coffee\r\n ice cubes',2,0,'brown','','add crushed ice to the blender\r\npour coffee Crème de Cacao irish cream irish whiskey into the blender\r\nblend together\r\nstrain into the cocktail glass\r\ngarnish with ground chocolate','/images/63.png',NULL,NULL,'Whiskey'),
(64,'The Classic Rob Roy',5,'2¼ parts Scotch\r\n1¼ parts sweet vermouth\r\n1 dash angostura\r\n ice cubes\r\n',5,0,'red','','fill up the shaker with ice cubes\r\npour sweet vermouth angostura Scotch into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cocktail cherry','/images/64.png',NULL,NULL,'Whiskey'),
(65,'Everybodys Irish',5,'2 parts irish whiskey\r\n1 tsp mint liqueur\r\n1 tsp Chartreuse\r\n ice cubes',8,0,'green','','fill up the shaker with ice\r\npour Chartreuse mint liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with olives','/images/65.png',NULL,NULL,'Whiskey'),
(66,'La Louisiane',5,'1 part canadian whisky\r\n1 part Benedictine\r\n1 part sweet vermouth\r\n1 dash absinthe\r\n1 dash angostura\r\n ice\r\n',8,0,'red','','fill up the shaker with ice\r\npour sweet vermouth canadian whisky angostura absinthe Benedictine into the shaker\r\nshake well\r\npour sweet vermouth canadian whisky angostura absinthe Benedictine into the cocktail glass\r\ngarnish with cocktail cherry\r\nstrain into the glass','/images/66.png',NULL,NULL,'Whiskey'),
(67,'Egg-nog',4,'3 parts Bourbon\r\n2 parts milk\r\n1 pinch sugar\r\n½ pinches salt\r\n1 tsp vanilla extract\r\n1 piece egg\r\n ice cubes',2,0,'white','','fill up the shaker with ice cubes\r\nadd Bourbon vanilla extract sugar salt milk egg to the shaker\r\nshake well\r\nstrain into the cocktail glass\r\ngarnish with cinnamon stick','/images/67.png',NULL,NULL,'Whiskey'),
(68,'Rye and Ginger',3,'3 parts canadian whisky\r\n6 parts ginger ale\r\n ice cubes',4,0,'brown','','pour whiskey into the collins glass\r\nadd ice cubes to the glass\r\nfill up the glass with ginger ale','/images/68.png',NULL,NULL,'Whiskey'),
(69,'Kerry Cooler',3,'2 parts irish whiskey\r\n1½ parts sherry\r\n1 part oregat syrup\r\n½ parts lemon juice\r\n1 part club soda\r\n ice cubes',4,0,'orange','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice oregat syrup sherry irish whiskey into the shaker\r\nshake well\r\nstrain into the collins glass\r\nfill up the glass with club soda\r\ngarnish with orange wheel','/images/69.png',NULL,NULL,'Whiskey'),
(70,'Red Snapper',4,'1 part canadian whisky\r\n1 part Amaretto\r\n2 parts cranberry juice\r\n1 part whiskey',4,0,'red','','fill up the shaker with ice\r\npour cranberry juice Amaretto canadian whisky into the shaker\r\nshake well\r\nstrain into the shot glass','/images/70.png',NULL,NULL,'Whiskey'),
(71,'CC Express',3,'1¾ parts whiskey\r\n1 part honey\r\n1 part lemon juice\r\n1 part pilsner\r\n ice',1,0,'orange','','add whiskey lemon juice honey to the collins glass\r\nstir together\r\nadd ice to the glass\r\nfill up the glass with pilsner\r\nstir together\r\ngarnish with lemon wedge','/images/71.png',NULL,NULL,'Whiskey'),
(72,'Irish Coffee',2,'2 parts irish whiskey\r\n1 tsp brown sugar\r\n4½ parts coffee\r\n1½ parts cream',1,0,'brown','','pour whiskey into the irish coffee glass\r\nadd brown sugar to the glass\r\nfill up the glass with coffee\r\ngently layer the cream\r\nuse the back of a teaspoon to separate layers when pouring','/images/72.png',NULL,NULL,'Whiskey'),
(73,'Blizzard',2,'2 parts whiskey\r\n¾ parts hazelnut liqueur\r\n¾ parts irish cream\r\n1 cup coffee\r\n ice\r\n',2,0,'brown','','add irish cream whiskey hazelnut liqueur to the irish coffee glass\r\npour coffee into the glass','/images/73.png',NULL,NULL,'Whiskey'),
(74,'Merry Irishman',5,'2 parts irish whiskey\r\n1 part coffee liqueur\r\n½ parts mint liqueur\r\n ice cubes',5,0,'brown','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour mint liqueur coffee liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass','/images/74.png',NULL,NULL,'Whiskey'),
(75,'Irish Shillelagh',5,'1½ parts irish whiskey\r\n½ parts Sloe gin\r\n1 tsp white rum\r\n1 tsp peach schnapps\r\n1 tsp sugar syrup\r\n1 tsp lemon juice\r\n1 tsp gold rum\r\n1 tsp dark rum\r\n ice cubes',5,0,'red','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour lemon juice sugar syrup peach schnapps white rum Sloe gin irish \r\nwhiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with cocktail cherry','/images/75.png',NULL,NULL,'Whiskey'),
(76,'Irish Canadian Sangree',4,'½ parts Irish Mist\r\n1 part canadian whisky\r\n½ parts lemon juice\r\n½ parts orange juice\r\n ice cubes',5,0,'orange','','fill up the old fashioned glass with ice\r\npour orange juice lemon juice canadian whisky Irish Mist into the glass\r\nstir together\r\ngarnish with ground nutmeg','/images/76.png',NULL,NULL,'Whiskey'),
(77,'Old Fashioned',4,'1 dash angostura\r\n2 parts whiskey\r\n1 splash club soda\r\n1 sugar cube\r\n ice cubes\r\n',5,0,'orange','','add sugar cube to the old fashioned glass\r\npour club sodaa ngostura into the glass\r\nstir together\r\nfill up the glass with ice cubes\r\nadd whiskey to the glass\r\ngarnish with cocktail cherry  orange wedge','/images/77.png',NULL,NULL,'Whiskey'),
(78,'Irish Eyes',2,'1 part irish whiskey\r\n1 dash mint liqueur\r\n2 parts half & half\r\n ice cubes',2,0,'green','','fill up the glass with ice\r\nfill up the shaker with ice\r\npour half & half mint liqueur irish whiskey into the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\ngarnish with cocktail cherry','/images/78.png',NULL,NULL,'Whiskey'),
(79,'Washington Apple',3,'½ parts canadian whisky\r\n½ parts apple schnapps\r\n½ parts cranberry juice',5,0,'red','','fill up the shaker with ice\r\npour cranberry juice apple schnapps canadian whisky into the shaker\r\nshake well\r\nstrain into the shot glass','/images/79.png',NULL,NULL,'Whiskey'),
(80,'Three Wise Men',5,'½ parts Scotch\r\n½ parts whiskey\r\n½ parts irish whiskey',5,0,'brown','','pour irish whiskey Bourbon Scotch into the shot glass','/images/80.png',NULL,NULL,'Whiskey'),
(81,'Snow Cap',4,'3 parts half & half\r\n2 parts whiskey\r\n1½ parts Triple sec\r\n1½ parts sugar syrup\r\n ice cubes',2,0,'white','','fill up the shaker with ice\r\npour sugar syrup Triple secB ourbonhalf & half into the shaker\r\nshake well\r\nstrain into the snifter glass','/images/81.png',NULL,NULL,'Whiskey'),
(82,'Musoka Maple Splash',4,'10 pieces mint leaves\r\n2¼ parts whiskey\r\n¾ parts maple syrup\r\n¾ parts lemon juice\r\n5 pieces peach\r\n1 part club soda\r\n ice',1,0,'clean','','add whiskey peachmint leaves lemon juice maple syrup ice to the shaker\r\nshake well\r\nstrain into the old fashioned glass\r\npour club soda into the glass\r\ngarnish with mint leaves','/images/82.png',NULL,NULL,'Whiskey'),
(83,'The Classic Mamie Taylor',3,'¾ parts lime juice\r\n3 parts Scotch\r\n6 parts ginger beer\r\n ice',1,0,'yellow','','add lime juice Scotch to the sour glass\r\npour ginger beer into the glass\r\ngarnish with lime wedge','/images/83.png',NULL,NULL,'Whiskey');

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
(2,'Girls\' Night'),
(3,'Guys\' Night'),
(4,'Downtown'),
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
(1,'Fall'),
(2,'Spring'),
(3,'Summer'),
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
(2,'Creamy'),
(3,'Frozen'),
(4,'Longdrink'),
(8,'Martini'),
(5,'Short'),
(6,'Tropical');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`surname`,`email`,`role`) values 
(1,'milja','$2a$10$CuwDkTuD4zc1x7adyx8NxuwHs7ML5qzHYK7bTha5FC/zVTwEzJK3O','Miljana','Ratkov','m.ratkov995@gmail.com','user'),
(2,'admin','$2a$04$RNs5Xtjo7F3upPGzSbVPTOfEOPkevYQYk96t82l4A47UenCK6l9Ou','Test','Admin','admin@gmail.com','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
