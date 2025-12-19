<?php

define( 'DB_NAME', ${MYSQL_DATABASE} );
define( 'DB_USER', ${MYSQL_USER} );
define( 'DB_PASSWORD', ${MYSQL_PASSWORD} );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );

#database collate, basically indicates how data is stored and compared. leave default for best results...
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

//generate new keys, these are generated using 'salt' at https://api.wordpress.org/secret-key/1.1/salt/

//WARNING: CHANGING ANY OF THESE KEYS WILL FORCE A USER TO LOGIN AGAIN AND ERASE ALL COOKIES. USER DISCRETION IS ADVISED.

define('AUTH_KEY',         'K|;xt(kqujOwwIkF@>:BmXFx&%(]7&v!JF=%dOl{Pw^?^Ha7gVg>#SztTPJJcv1#');
define('SECURE_AUTH_KEY',  'j6Hom1LG|8{84!h/Fy6JCSq2`j(B|9F)j;?h5uPD6ak1+=9Lge|Ev+W?eXZmS@-Y');
define('LOGGED_IN_KEY',    '|aX;G^Ou5vAFt|HToMtTv/KM=+>+c4+/v}|vniqe^f-M>da3LZ>KsQ23Zj!)_nKC');
define('NONCE_KEY',        'rsbqX~+*yY)n<@G$(EQnkL#qO25]-y+|IB@f>1IE3G)HsorZQpPl+|//m;S#Td+2');
define('AUTH_SALT',        '2(tG[>5K.bn&j-d?:IEL)u=jB|3fzx|d6jshke>]h]6UAKUMp?~|VVl)>%|>jY-l');
define('SECURE_AUTH_SALT', 'yN_riY:ACx]IkigDTpdDagS5{?kpzy~(Q~N)&OAQ6>p$V~9-.eP?Z,e|TE,j|pnU');
define('LOGGED_IN_SALT',   '()|?Sk; W=a[o,Y#T6W|^OaTeFx=4|s[,x{#h83;,4u+O:hVeNfpWJ_ #&+)KP:N');
define('NONCE_SALT',       '393uA]X]IY&vAtVHhLCK1u(~ADrMo~ #+x+q7nuf-j:xL [QcboR`#eAm&KH?K+R');

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

# Sets up WordPress vars and included files.
require_once ABSPATH . 'wp-settings.php';

?>