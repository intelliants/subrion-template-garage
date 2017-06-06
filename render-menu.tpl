{if 'mainmenu' == $position}
    {ia_menu menus=$menu.contents class="nav navbar-nav navbar-right nav-main {$menu.classname}"}
{elseif 'inventory' == $position}
    {ia_menu menus=$menu.contents class="nav-inventory hidden-sm hidden-xs pull-right {$menu.classname}"}
{elseif 'account' == $position}
    {if 'account' == $menu.name && $member && $core.config.members_enabled}
        <ul class="nav-inventory pull-right nav-account">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="nav-inventory__icon material-icons">account_circle</i>
                    {$member.fullname|default:$member.username}
                    <i class="fa fa-angle-down"></i>
                </a>
                {ia_hooker name='smartyFrontInsideAccountBox'}
                {ia_menu menus=$menu.contents class='dropdown-menu pull-right' loginout=true}
            </li>
        </ul>
    {else}
        <ul class="nav-inventory pull-right">
            <li{if 'login' == $core.page.name} class="active"{/if}>
                <a data-toggle="modal" data-target="#loginModal" href="#">
                    <i class="nav-inventory__icon material-icons">assignment_ind</i>
                    {lang key='login'}
                </a>
            </li>
            <li{if 'member_registration' == $core.page.name} class="active"{/if}>
                <a href="{$smarty.const.IA_URL}registration/">
                    <i class="nav-inventory__icon material-icons">assignment</i>
                    {lang key='register'}
                </a>
            </li>
        </ul>

        <div class="modal fade" id="loginModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{lang key='login_sign_up'}</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>{lang key='login'}</h4>

                                    <form action="{$smarty.const.IA_URL}login/" method="post">
                                        {preventCsrf}

                                        <div class="form-group">
                                            <label for="field_login">{lang key='username_or_email'}:</label>
                                            <input class="form-control" type="text" tabindex="4" name="username" value="{if isset($smarty.post.username)}{$smarty.post.username|escape}{/if}">
                                        </div>

                                        <div class="form-group">
                                            <label for="field_password">{lang key='password'}:</label>
                                            <input class="form-control" type="password" tabindex="5" name="password">
                                        </div>

                                        <div class="form-group form-actions">
                                            <button class="btn btn-primary" type="submit" tabindex="6" name="login">{lang key='login'}</button>
                                            <a class="btn btn-link" href="{$smarty.const.IA_URL}forgot/">{lang key='forgot'}</a>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6">
                                    <h4>{lang key='register'}</h4>
                                    <p>{lang key='registration_tooltip'}</p>
                                    <p><a class="btn btn-success" href="{$smarty.const.IA_URL}registration/" rel="nofollow">{lang key='registration'}</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    {/if}
{elseif in_array($position, array('left', 'right', 'user1', 'user2', 'top'))}
    {if !empty($menu.contents[0]) && 'account' != $menu.name}
        {ia_block header=$menu.header title=$menu.title movable=true id=$menu.id name=$menu.name collapsible=$menu.collapsible classname=$menu.classname}
            {ia_menu menus=$menu.contents class="list-group {$menu.classname}"}
        {/ia_block}
    {/if}
{elseif 'copyright' == $position ||
        'footer1' == $position || 'footer2' == $position  ||
        'footer3' == $position || 'footer4' == $position}
    <!--__ms_{$menu.id}-->
    {if $menu.header || isset($manageMode)}
        <div class="nav-footer-caption {$menu.classname}">{$menu.title}</div>
    {else}
        <div class="menu {$menu.classname}">
    {/if}

    <!--__ms_c_{$menu.id}-->
    {ia_menu menus=$menu.contents class='nav-footer'}
    <!--__me_c_{$menu.id}-->

    {if $menu.header || isset($manageMode)}
    {else}
        </div>
    {/if}
    <!--__me_{$menu.id}-->
{else}
    <!--__ms_{$menu.id}-->
    {if $menu.header || isset($manageMode)}
        <div class="nav-menu-header {$menu.classname}">{$menu.title}</div>
    {else}
        <div class="menu {$menu.classname}">
    {/if}

    <!--__ms_c_{$menu.id}-->
    {ia_menu menus=$menu.contents class='nav-menu'}
    <!--__me_c_{$menu.id}-->

    {if $menu.header || isset($manageMode)}
    {else}
        </div>
    {/if}
    <!--__me_{$menu.id}-->
{/if}