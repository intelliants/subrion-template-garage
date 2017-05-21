<div class="ia-item ia-item--border ia-item--{$listing.status} {if $listing.featured}ia-item--featured{/if} {if $listing.sponsored}ia-item--sponsored{/if}">
    <div class="ia-item__actions">
        {printFavorites item=$listing itemtype='autos_parts' guests=true}
    </div>

    <a class="ia-item__image" href="{ia_url item='autos_parts' data=$listing type='url'}">
        {if !empty($listing.pictures)}
            {ia_image file=$listing.pictures[0] title=$listing.title class='img-responsive'}
        {else}
            <img class="img-responsive" title="{$listing.title}" src="{$smarty.const.IA_CLEAR_URL}templates/garage/img/no-preview.png">
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
        <div class="ia-item__title">
            {ia_url item='autos_parts' type='link' data=$listing text=$listing.title}
        </div>

        <div class="ia-item__additional">
            <p class="text-success">{$core.config.currency} {$listing.price}</p>
        </div>

        <div class="ia-item__body">{$listing.description|escape|truncate:150:'...':true}</div>
    </div>
</div>