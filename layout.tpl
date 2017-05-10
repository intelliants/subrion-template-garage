<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
    <head>
        {ia_hooker name='smartyFrontBeforeHeadSection'}

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <title>{ia_print_title}</title>
        <meta name="description" content="{$core.page['meta-description']}">
        <meta name="keywords" content="{$core.page['meta-keywords']}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="generator" content="Subrion CMS - Open Source Content Management System">
        <meta name="robots" content="index">
        <meta name="robots" content="follow">
        <meta name="revisit-after" content="1 day">
        <base href="{$smarty.const.IA_URL}">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

        {ia_add_media files='jquery, subrion, bootstrap' order=0}
        {ia_print_js files='_IA_TPL_owl.carousel.min, _IA_TPL_app' order=999}

        {ia_hooker name='smartyFrontAfterHeadSection'}

        {ia_print_css display='on'}

        {ia_add_js}
            intelli.pageName = '{$core.page.name}';

            {foreach $core.customConfig as $key => $value}
                intelli.config.{$key} = '{$value}';
            {/foreach}
        {/ia_add_js}

        {if $core.config.custom_colors}
            <style type="text/css">
                body { background-color: {$core.config.custom_color_body_bg}; color: {$core.config.custom_color_text}; }
                h1, h2, h3, h4, h5, h6,
                .box__caption { color: {$core.config.custom_color_headings}; }
                a,
                a:focus { color: {$core.config.custom_color_link}; }
                a:hover { color: {$core.config.custom_color_link_hover}; }

                .inventory { background-color: {$core.config.custom_color_inventory_bg}; }
                .nav-inventory > li > a,
                .nav-inventory > li > a:focus { color: {$core.config.custom_color_inventory_link}; }
                .nav-inventory > li > a:hover { color: {$core.config.custom_color_inventory_link_hover}; }
                .nav-inventory > li.active > a,
                .nav-inventory > li.active > a:focus,
                .nav-inventory > li.active > a:hover { color: {$core.config.custom_color_inventory_link_active}; }

                .navbar-default { background-color: {$core.config.custom_color_navbar_bg_inner_page}; }
                .navbar-default .navbar-nav > li > a,
                .navbar-default .navbar-nav > li > a:focus { color: {$core.config.custom_color_navbar_link}; }
                .navbar-default .navbar-nav > li > a:hover { color: {$core.config.custom_color_navbar_link_hover}; }
                .navbar-default .navbar-nav > li.active > a,
                .navbar-default .navbar-nav > li.active > a:focus,
                .navbar-default .navbar-nav > li.active > a:hover { color: {$core.config.custom_color_navbar_link_active}; }

                @media (min-width: 768px) {
                    .page-index .navbar-default { background-color: {$core.config.custom_color_navbar_bg_home_page}; }
                }

                .header {
                    {if $core.config.bg_header_use_color}
                        background: {$core.config.bg_header_color};
                    {elseif $core.config.bg_header}
                        background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_header}');
                    {/if}
                }

                .footer { background: {$core.config.footer_bg}; }
                .footer ul > li > a,
                .footer ul > li > a:focus { color: {$core.config.footer_link}; }
                .footer ul > li > a:hover { color: {$core.config.footer_link_hover}; }
                .footer ul > li.active > a,
                .footer ul > li.active > a:focus,
                .footer ul > li.active > a:hover { color: {$core.config.footer_link_active}; }
            </style>
        {/if}
    </head>

    <body class="page-{$core.page.name}">
        <div class="inventory">
            <div class="container">
                {if $core.config.website_social}
                    <ul class="nav-inventory nav-inventory-social pull-left hidden-xs">
                        {if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
                        {if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
                        {if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
                        {if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a></li>{/if}
                    </ul>
                {/if}
                {ia_blocks block='account'}
                <ul class="nav-inventory pull-right hidden-xs">
                    <li><a href="{$smarty.const.IA_URL}comparison/"><i class="nav-inventory__icon material-icons">compare_arrows</i> {lang key='compare'}</a></li>
                    <li><a href="{$smarty.const.IA_URL}favorites/"><i class="nav-inventory__icon material-icons">star</i> {lang key='wishlist'}</a></li>
                </ul>
                {include 'language-selector.tpl'}
            </div>
        </div>

        <nav class="navbar navbar-default {if $core.config.navbar_sticky}navbar-sticky{/if}">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
                        {if $core.config.enable_text_logo}
                            {$core.config.logo_text}
                        {else}
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <img src="{$img}logo.png" alt="{$core.config.site}">
                            {/if}
                        {/if}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav navbar-right nav-action">
                        <li><a href="{$core.packages.autos.url}add/">{lang key='add_listing'}</a></li>
                    </ul>
                    {ia_blocks block='mainmenu'}
                </div>
            </div>
        </nav>

        {if isset($smarty.get.elements)}
            {include 'page.elements.tpl'}
        {else}
            {if 'index' == $core.page.name}
                <header class="header">
                    <div class="header__container-full-height">
                        <div class="header__container-full-height__middle">
                            <h1 class="header__title">{lang key='teaser_title'}</h1>
                            {ia_blocks block='quicksearch'}
                        </div>
                    </div>
                    {if 'index' == $core.page.name}
                        <a href="#" class="icon-scroll-to-content js-scroll-to-content hidden-xs"></a>
                    {/if}
                </header>
            {/if}

            {ia_hooker name='smartyFrontBeforeBreadcrumb'}

            {include 'breadcrumb.tpl'}

            {if isset($iaBlocks.verytop)}
                <div class="verytop">
                    {ia_blocks block='verytop'}
                </div>
            {/if}

            {if $core.config.enable_landing && 'index' == $core.page.name}
                <div class="landing">
                    {ia_blocks block='landing'}
                </div>
            {else}
                <div class="content">
                    <div class="container">
                        {if in_array($core.page.name, array('login', 'member_registration'))}
                            <div class="page-system">
                                <div class="content__header">
                                    <h1>{$core.page.title}</h1>
                                    <ul class="content__actions">
                                        {foreach $core.actions as $name => $action}
                                            <li>
                                                {if 'action-favorites' == $name}
                                                    {printFavorites item=$item itemtype=$item.item guests=true}
                                                {else}
                                                    <a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                                        <span class="fa fa-{$name}"></span>
                                                    </a>
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>

                                {ia_hooker name='smartyFrontBeforeNotifications'}
                                {include 'notification.tpl'}

                                {ia_hooker name='smartyFrontBeforeMainContent'}

                                <div class="content__body">
                                    {$_content_}
                                </div>

                                {ia_hooker name='smartyFrontAfterMainContent'}
                            </div>
                        {else}
                            <div class="row">
                                <div class="{width section='content' position='left' tag='col-md-'} aside">
                                    {ia_blocks block='left'}
                                </div>
                                <div class="{width section='content' position='center' tag='col-md-'}">
                                    <div class="content__wrap">

                                        {ia_blocks block='top'}

                                        <div class="content__header">
                                            <h1>{$core.page.title}</h1>
                                            <ul class="content__actions">
                                                {foreach $core.actions as $name => $action}
                                                    <li>
                                                        {if 'action-favorites' == $name}
                                                            {printFavorites item=$item itemtype=$item.item guests=true}
                                                        {else}
                                                            <a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                                                <span class="fa fa-{$name}"></span>
                                                            </a>
                                                        {/if}
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>

                                        {ia_hooker name='smartyFrontBeforeNotifications'}
                                        {include 'notification.tpl'}

                                        {ia_hooker name='smartyFrontBeforeMainContent'}

                                        <div class="content__body">
                                            {$_content_}
                                        </div>

                                        {ia_hooker name='smartyFrontAfterMainContent'}

                                        {ia_blocks block='bottom'}
                                    </div>
                                </div>
                                <div class="{width section='content' position='right' tag='col-md-'} aside">
                                    {ia_blocks block='right'}
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}

            {if isset($iaBlocks.verybottom)}
                <div class="verybottom">
                    {ia_blocks block='verybottom'}
                </div>
            {/if}
        {/if}

        <footer class="footer">
            <div class="container">
                {if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) ||
                    isset($iaBlocks.footer3) || isset($iaBlocks.footer4) || $core.config.website_social}
                    <div class="row">
                        {if isset($iaBlocks.footer1)}
                            <div class="col-md-2 col-sm-6">
                                {ia_blocks block='footer1'}
                            </div>
                        {/if}
                        {if isset($iaBlocks.footer2)}
                            <div class="col-md-2 col-sm-6">
                                {ia_blocks block='footer2'}
                            </div>
                        {/if}
                        {if isset($iaBlocks.footer3)}
                            <div class="col-md-2 col-sm-6">
                                {ia_blocks block='footer3'}
                            </div>
                        {/if}
                        {if isset($iaBlocks.footer4)}
                            <div class="col-md-4 col-sm-6">
                                {ia_blocks block='footer4'}
                            </div>
                        {/if}
                        {if $core.config.website_social}
                            <div class="col-md-2 col-sm-12">
                                <div class="nav-footer-caption">
                                    {lang key='follow_us'}
                                </div>
                                <ul class="nav-footer nav-footer-social">
                                    {if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
                                    {if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
                                    {if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
                                    {if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a></li>{/if}
                                </ul>
                            </div>
                        {/if}
                    </div>
                {/if}

                {ia_hooker name='smartyFrontBeforeFooterLinks'}

                {ia_blocks block='copyright'}

                <div class="footer__logo">
                    <a href="{$smarty.const.IA_URL}">
                        {if $core.config.enable_text_logo}
                            {$core.config.logo_text}
                        {else}
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <img src="{$img}logo.png" alt="{$core.config.site}">
                            {/if}
                        {/if}
                    </a>
                </div>

                <p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>

                {ia_hooker name='smartyFrontAfterFooterLinks'}
            </div>
        </footer>

        <!-- SYSTEM STUFF -->

        {if $core.config.cron}
            <div style="display: none;">
                <img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
            </div>
        {/if}

        {if isset($manageMode)}
            {include 'visual-mode.tpl'}
        {/if}

        {if isset($previewMode)}
            <p>{lang key='youre_in_preview_mode'}</p>
        {/if}

        {ia_print_js display='on'}

        {ia_hooker name='smartyFrontFinalize'}
    </body>
</html>