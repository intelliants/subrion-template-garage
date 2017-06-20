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
                body { color: {$core.config.custom_color_text}; }
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

                .header-front-page {
                    {if $core.config.bg_header_use_color}
                        background: {$core.config.bg_header_color};
                    {elseif $core.config.bg_header}
                        background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_header}');
                    {/if}
                }

                {if $core.config.bg_header_use_color}
                    .header-inner-page { background: {$core.config.bg_header_color}; }
                    .header-view-page { background: {$core.config.bg_header_color}; }
                {/if}

                {if !empty($core.config.bg_call_to_action)}
                    .call-to-action { background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_call_to_action}'); }
                {/if}

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
        <div class="inventory {if 'index' != $core.page.name}inventory--inner{/if}">
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
                        <li class="dropdown">
                            <a data-toggle="dropdown" href="{$core.packages.autos.url}add/">{lang key='add'} <span class="fa fa-plus"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="{$core.packages.autos.url}add/">{lang key='add_listing'}</a></li>
                                <li><a href="{$core.packages.autos.url}service/add/">{lang key='add_service'}</a></li>
                                <li><a href="{$core.packages.autos.url}part/add/">{lang key='add_part'}</a></li>
                            </ul>
                        </li>
                    </ul>
                    {ia_blocks block='mainmenu'}
                </div>
            </div>
        </nav>

        {if 'index' == $core.page.name}
            <header class="header-front-page">
                <div class="header-front-page__container-full-height">
                    <div class="header-front-page__container-full-height__middle">
                        <h1 class="header-front-page__title">{lang key='teaser_title'}</h1>
                        {if isset($iaBlocks.quicksearch)}
                            {ia_blocks block='quicksearch'}
                        {/if}
                    </div>
                </div>
                {*<a href="#" class="icon-scroll-to-content js-scroll-to-content hidden-xs"></a>*}
            </header>
        {elseif 'autos_view' == $core.page.name}
            <header class="header-view-page header-view-page--offset">
                <div class="container">
                    <div class="pull-left">
                        <h1 class="page-title">{lang key='car_details'}</h1>
                        {ia_hooker name='smartyFrontBeforeBreadcrumb'}
                        {include 'breadcrumb.tpl'}
                    </div>
                    <div class="pull-right">
                        <ul class="header-view-page__actions">
                            {foreach $core.actions as $name => $action}
                                <li>
                                    {if 'action-favorites' == $name}
                                        {printFavorites item=$item itemtype=$item.item guests=true}
                                    {else}
                                        <a data-toggle="tooltip" title="{$action.title|escape}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                            <span class="fa fa-{$name}"></span>
                                        </a>
                                    {/if}
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </header>
            <div class="separator">
                <div class="container">
                    {include 'extra:autos/view.main-info'}
                </div>
            </div>
        {else}
            <header class="header-inner-page{if in_array($core.page.name, ['autos_index', 'search_autos']) && isset($iaBlocks.quicksearch)} header-inner-page--offset{/if}">
                <div class="container">
                    <h1 class="page-title">{$core.page.title}</h1>
                    {ia_hooker name='smartyFrontBeforeBreadcrumb'}
                    {include 'breadcrumb.tpl'}
                </div>
            </header>
            {if in_array($core.page.name, ['autos_index', 'search_autos']) && isset($iaBlocks.quicksearch)}
                <div class="separator">
                    <div class="container">
                        {if isset($iaBlocks.quicksearch)}
                            {ia_blocks block='quicksearch'}
                        {/if}
                    </div>
                </div>
            {/if}
        {/if}

        {if isset($smarty.get.elements)}
            {include 'page.elements.tpl'}
        {else}
            {if isset($iaBlocks.verytop)}
                <div class="verytop">
                    {ia_blocks block='verytop'}
                </div>
            {/if}

            {if $core.config.enable_landing && 'index' == $core.page.name}
                {if isset($iaBlocks.bodytypes) || isset($iaBlocks.popular_makes)}
                    <div class="container">
                        <div class="bodytypes-and-makes">
                            <div class="row">
                                {if isset($iaBlocks.bodytypes)}
                                    <div class="{width section='filters' position='bodytypes' tag='col-md-'} bodytypes">
                                        {ia_blocks block='bodytypes'}
                                    </div>
                                {/if}
                                {if isset($iaBlocks.popular_makes)}
                                    <div class="{width section='filters' position='popular_makes' tag='col-md-'} popular-makes">
                                        {ia_blocks block='popular_makes'}
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}

                {if (isset($iaBlocks.landing_tab1) && isset($car_blocks_data.featured)) ||
                    (isset($iaBlocks.landing_tab2)) ||
                    (isset($iaBlocks.landing_tab3) && isset($car_blocks_data.recent))}
                    <div class="landing-tabs">
                        <div class="landing-tabs__tabs">
                            <div class="container">
                                <ul>
                                    {if isset($iaBlocks.landing_tab1) && isset($car_blocks_data.featured)}
                                        {$blockFrontTab = array_shift($iaBlocks.landing_tab1)}
                                        <li class="active">
                                            <a data-toggle="tab" href="#landing-tab-1">{lang key="block_title_{$blockFrontTab.id}"}</a>
                                        </li>
                                    {/if}
                                    {if isset($iaBlocks.landing_tab2)}
                                        {$blockFrontTab = array_shift($iaBlocks.landing_tab2)}
                                        <li{if !isset($iaBlocks.landing_tab1) && !isset($car_blocks_data.featured)} class="active"{/if}>
                                            <a data-toggle="tab" href="#landing-tab-2">{lang key="block_title_{$blockFrontTab.id}"}</a>
                                        </li>
                                    {/if}
                                    {if isset($iaBlocks.landing_tab3) && isset($car_blocks_data.recent)}
                                        {$blockFrontTab = array_shift($iaBlocks.landing_tab3)}
                                        <li{if (!isset($iaBlocks.landing_tab1) || !isset($car_blocks_data.featured)) && !isset($iaBlocks.landing_tab2)} class="active"{/if}>
                                            <a data-toggle="tab" href="#landing-tab-3">{lang key="block_title_{$blockFrontTab.id}"}</a>
                                        </li>
                                    {/if}
                                </ul>
                            </div>
                        </div>
                        <div class="container">
                            <div class="tab-content">
                                {if isset($iaBlocks.landing_tab1) && isset($car_blocks_data.featured)}
                                    <div id="landing-tab-1" class="tab-pane fade in active">
                                        {ia_blocks block='landing_tab1'}
                                    </div>
                                {/if}
                                {if isset($iaBlocks.landing_tab2)}
                                    <div id="landing-tab-2" class="tab-pane fade{if !isset($iaBlocks.landing_tab1)} in active{/if}">
                                        {ia_blocks block='landing_tab2'}
                                    </div>
                                {/if}
                                {if isset($iaBlocks.landing_tab3) && isset($car_blocks_data.recent)}
                                    <div id="landing-tab-3" class="tab-pane fade{if (!isset($iaBlocks.landing_tab1) || !isset($car_blocks_data.featured)) && !isset($iaBlocks.landing_tab2)} in active{/if}">
                                        {ia_blocks block='landing_tab3'}
                                    </div>
                                {/if}
                            </div>

                            <div class="landing-tabs__actions">
                                <a href="{$core.packages.autos.url}autos/" class="btn btn-dark btn-rounded">{lang key='see_all'}</a>
                                <a href="{$core.packages.autos.url}add/" class="btn btn-accent btn-rounded">{lang key='sell_yours'}</a>
                            </div>
                        </div>
                    </div>
                {/if}

                {if isset($iaBlocks.landing)}
                    <div class="landing">
                        {ia_blocks block='landing'}
                    </div>
                {/if}

                {if $core.config.enable_call_to_action}
                    <div class="call-to-action">
                        <div class="container">
                            <div class="call-to-action__content">
                                {if !empty($core.config.call_to_action_title)}
                                    <div class="call-to-action__content__title">
                                        {$core.config.call_to_action_title}
                                    </div>
                                {/if}
                                {if !empty($core.config.call_to_action_description)}
                                    <div class="call-to-action__content__description">
                                        {$core.config.call_to_action_description}
                                    </div>
                                {/if}
                            </div>
                            <div class="call-to-action__action">
                                <a href="{$core.packages.autos.url}add/">{lang key='sell_your_car'}</a>
                            </div>
                        </div>
                    </div>
                {/if}

                {if isset($iaBlocks.services) || isset($iaBlocks.parts)}
                    <div class="services-and-parts">
                        <div class="container">
                            <div class="row">
                                <div class="{width section='services-and-parts' position='parts' tag='col-md-'}">
                                    {ia_blocks block='parts'}
                                </div>
                                <div class="{width section='services-and-parts' position='services' tag='col-md-'}">
                                    {ia_blocks block='services'}
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {else}
                <div class="content{if (in_array($core.page.name, ['autos_index', 'search_autos', 'autos_view']) && isset($iaBlocks.quicksearch)) || 'autos_view' == $core.page.name} content--offset{/if}">
                    <div class="container">
                        {if in_array($core.page.name, array('login', 'member_registration'))}
                            <div class="page-system">
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

                                        {if 'index' == $core.page.name}
                                            <div class="content__header">
                                                <h1>{$core.page.title}</h1>
                                            </div>
                                        {/if}

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
                {if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) || isset($iaBlocks.footer3) ||
                    isset($iaBlocks.footer4) || isset($iaBlocks.footer5)}
                    <div class="row">
                        <div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
                        <div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
                        <div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
                        <div class="{width section='footer-blocks' position='footer4' tag='col-md-'}">{ia_blocks block='footer4'}</div>
                        <div class="{width section='footer-blocks' position='footer5' tag='col-md-'}">{ia_blocks block='footer5'}</div>
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
