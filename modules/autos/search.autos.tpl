{if !empty($listings)}
    <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout) && 'list' == $smarty.cookies.cardsLayout} -list{$smarty.cookies.cardsLayout}{else} -grid{/if}">
        <div class="row">
            {foreach $listings as $listing}
            <div class="col-md-4">
                {include 'extra:autos/list-autos'}
            </div>

            {if $listing@iteration % 3 == 0 && !$listing@last}
        </div>
        <div class="row">
            {/if}
            {/foreach}
        </div>
    </div>
{else}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}