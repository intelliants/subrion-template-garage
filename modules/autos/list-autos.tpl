<div class="ia-card {if 'hidden' == $listing.status}ia-card--hidden{/if} {if $listing.featured}ia-card--featured{/if} {if $listing.sponsored}ia-card--sponsored{/if}">
    {printFavorites item=$listing itemtype='autos' guests=true}

    {if 'favorites' != $core.page.name}
        <a href="#" title="{lang key='add_to_compare'}" data-id="{$listing.id}" class="ia-card__action ia-card__action--compare btn-compare{if ($listing.compare)} active btn-compare--added{/if}">
            <i class="material-icons">compare_arrows</i>
        </a>
    {/if}

    {if $listing.pictures}
        {$picture = array_shift($listing.pictures)}
    {else}
        {$picture = ''}
    {/if}

    <a class="ia-card__image{if empty($picture)} ia-card__image--no-image{/if}" href="{$listing.link}">
        {ia_image file=$picture title="{$listing.model|escape:'html'} {$listing.release_year}" type='thumbnail' class='img-responsive'}

        {if $listing.featured}
            <span class="ia-card__badge ia-card__badge--featured" title="{lang key='featured'}">{lang key='featured'}</span>
        {/if}
        {if $listing.sponsored}
            <span class="ia-card__badge ia-card__badge--sponsored" title="{lang key='sponsored'}">{lang key='sponsored'}</span>
        {/if}
        {if $member && $member.id == $listing.member_id && 'active' != $listing.status}
            <span class="label label-status label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}">{lang key=$listing.status default=$listing.status}</span>
        {/if}
    </a>

    <div class="ia-card__content">
        <div class="ia-card__inner-block">
            <div class="ia-card__content__left">
                <a class="ia-card__title" href="{$listing.link}"><strong>{$listing.make}</strong> {$listing.make_model}</a>
            </div>
            <div class="ia-card__content__right">
                {if $listing.price}
                    <div class="ia-card__price">
                        {$core.config.currency} {$listing.price}
                    </div>
                    <div class="ia-card__average-price">
                        {if isset($listing.average_price) && $listing.price !== $listing.average_price && $core.config.autos_display_average_price}
                            {if $listing.price > $listing.average_price}
                                <span class="fa fa-caret-up"></span> {lang key='above_average'}
                            {else}
                                <span class="fa fa-caret-down"></span> {lang key='below_average'}
                            {/if}
                        {/if}
                    </div>
                {/if}
            </div>
        </div>
        {if $listing.additional_info}
            <p class="ia-card__summary">{$listing.additional_info|strip_tags|truncate:150:'...':true}</p>
        {/if}
        <div class="ia-card__inner-block">
            <div class="ia-card__content__left">
                <div class="ia-card__info">
                    {$listing.release_year}{if $listing.transmission}, {$listing.transmission}{/if}{if $listing.mileage}, <span class="ia-card__field--mileage">{intval($listing.mileage)}k+ {lang key='unit'}</span>{/if}
                </div>
            </div>
            <div class="ia-card__content__right">
                {if $listing.exterior_color}
                    <div class="ia-card__color" style="background-color:{$listing.exterior_color};"></div>
                {/if}
            </div>
        </div>
    </div>
</div>

