<div class="ia-item ia-item--border ia-item--{$listing.status} {if $listing.featured}ia-item--featured{/if} {if $listing.sponsored}ia-item--sponsored{/if}">
    <div class="ia-item__actions">
        {printFavorites item=$listing guests=true}
    </div>

    <a class="ia-item__image" href="{$listing.link}">
        {if !empty($listing.pictures)}
            {ia_image file=$listing.pictures[0] type='thumbnail' title=$listing.title class='img-responsive'}
        {else}
            <img class="img-responsive" title="{$listing.titl|escape}" src="{$img}no-preview.png">
        {/if}
    </a>

    <div class="ia-item__labels">
        {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
        {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}

        {if $member && $member.id == $listing.member_id && 'active' != $listing.status}
            <span class="label label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
        {/if}
    </div>

    <div class="ia-item__content">
        <div class="row">
            <div class="col-md-8">
                <div class="ia-item__title">
                    {ia_url item='autos_parts' type='link' data=$listing text=$listing.title}
                </div>
            </div>
            <div class="col-md-4">
                <div class="ia-item__price">{$listing.price_formatted}</div>
            </div>
        </div>

        <div class="ia-item__body">{$listing.description|escape|truncate:150:'...':true}</div>
    </div>
</div>