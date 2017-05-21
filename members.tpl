<ul class="nav nav-tabs m-b">
    <li><span>{lang key='sort_by'}</span></li>
    <li{if !$activeGroup} class="active"{/if}><a href="{$smarty.const.IA_SELF}?group=all">{lang key='all'}</a></li>

    {if !empty($usergroups)}
        {foreach $usergroups as $entryId => $name}
            <li{if $activeGroup && $entryId == $activeGroup} class="active"{/if}><a href="{$smarty.const.IA_SELF}?group={$entryId}" rel="nofollow">{lang key="usergroup_{$name}"}</a></li>
        {/foreach}
    {/if}
</ul>

<div class="tab-content">
    <div id="tab-all" class="tab-pane{if !$activeGroup} active{/if}">
        {if !$activeGroup && !empty($letters)}
            <ul class="nav nav-pills nav-pills-sm m-b">
                {foreach $letters.all as $letter}
                    {if $letter == $letters.active || !in_array($letter, $letters.existing)}
                        <li{if $letter == $letters.active} class="active"{/if}><a href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a></li>
                    {else}
                        <li><a href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a></li>
                    {/if}
                {/foreach}
            </ul>
        {/if}
    </div>

    {if !empty($usergroups)}
        {foreach $usergroups as $entryId => $name}
            <div id="tab-usergroups" class="tab-pane{if $entryId == $activeGroup} active{/if}">
                {if $entryId == $activeGroup && isset($letters) && $letters}
                    <ul class="nav nav-pills nav-pills-sm m-b">
                        {foreach $letters.all as $letter}
                            {if $letter == $letters.active || !in_array($letter, $letters.existing)}
                                <li{if $letter == $letters.active} class="active"{/if}><a href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a></li>
                            {else}
                                <li><a href="{$smarty.const.IA_URL}members/{$letter}/">{$letter}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}
            </div>
        {/foreach}
    {/if}
</div>

<div id="js-search-results-container">
    <div class="ia-items">
        {if !empty($members)}
            <div class="row">
            {foreach $members as $listing}
                <div class="col-md-3">
                    {include 'list-members.tpl'}
                </div>

                {if $listing@iteration % 3 == 0 && !$listing@last}
            </div>
            <div class="row">
                {/if}
                {/foreach}
            </div>
        {else}
            <div class="alert alert-info">{lang key='no_members'}</div>
        {/if}
    </div>
</div>

{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=1}
