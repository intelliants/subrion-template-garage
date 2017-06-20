{if $core.page.breadcrumb|count}
    <ol class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    {foreach $core.page.breadcrumb as $entry}
        {if $entry.url && !$entry@last}
            <li typeof="v:Breadcrumb">
                <a href="{$entry.url}"{if isset($entry.no_follow) && $entry.no_follow} rel="nofollow"{/if} rel="v:url" property="v:title">{$entry.caption|escape}</a>
            </li>
        {else}
            <li class="active">{$entry.caption|escape}</li>
        {/if}
    {/foreach}
    </ol>
{/if}