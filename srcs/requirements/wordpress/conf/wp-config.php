<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DATABASE_NAME') );

/** MySQL database username */
define( 'DB_USER', getenv('DATABASE_USR') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('DATABASE_PWD') );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'F#ylo[.$wCV_wmUQ)oxPT+yI_t+PQca=]Uc.*H>%a:E<Q3S~?MZ.]xXJZ[;0zV9a');
define('SECURE_AUTH_KEY',  'tfY6<-nD6rm+Ldl&LbYQeHDy)D`J6HPh,{T8EDjs-7fK aq7&4xj(`@nn@b)ymt,');
define('LOGGED_IN_KEY',    'xEtAIu;sR;Ku*s~R-5ZG?e-h=+`<8M:x:i+t4hPVnC-<Zr8V>c/2e8[Gstc<AnxN');
define('NONCE_KEY',        '`j3t.ldbC9UK}sy2o**b3v[1:a-Jqv6_Q{E6iQ[L%J|k`#kz|CA*?QY!Ayg*d FT');
define('AUTH_SALT',        '/~>S+=cuX EvS7z:|>=XKf5c:oDp1GOBSGM<qJ@}r%|yp(_ xaZV_FkR!ou9?a<D');
define('SECURE_AUTH_SALT', '_x|C&-Duv5`!]AWFNerl+^r~7kpz:)xY{=Av7i4]`lvScb|b806L>:Q{W%3$V|Hi');
define('LOGGED_IN_SALT',   'dPJXHT_/<;fBDOr+U-|{Er]6XLr7YJ>t N>[T7mAA>(PKg9Zfu#YV#vtqi-V1.62');
define('NONCE_SALT',       '-|JE.<r y1{LW3E}Tq]Khv!$ay 0%xgO-ozq`dDWv+Cg,Ef,#;4~ {^+b5-Njge;');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';