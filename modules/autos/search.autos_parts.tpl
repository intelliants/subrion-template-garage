{if !empty($listings)}
    <div class="ia-items">
        {foreach $listings as $listing}
            {include 'extra:autos/list-autos_parts'}
        {/foreach}
    </div>
{else}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}