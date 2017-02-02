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
				<a href="{$smarty.const.IA_URL}login/">
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