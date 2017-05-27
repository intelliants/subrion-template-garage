<div class="ia-item ia-item--border ia-item--{$listing.status} {if $listing.featured}ia-item--featured{/if} {if $listing.sponsored}ia-item--sponsored{/if}">
    <div class="ia-item__actions">
        {printFavorites item=$listing itemtype='autos_services' guests=true}
    </div>

    <a class="ia-item__image" href="{ia_url item='autos_services' data=$listing type='url'}">
        {if !empty($listing.logo)}
            {ia_image file=$listing.logo title=$listing.title class='img-responsive'}
        {else}
            <img class="img-responsive" title="{$listing.title}" src="{$img}no-preview.png">
        {/if}
    </a>

    <div class="ia-item__labels">
        {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
        {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}

        {if $member && $member.id == $listing.member_id && iaCore::STATUS_ACTIVE != $listing.status}
            <span class="label label-{$listing.status}" title="{lang key=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status}</span>
        {/if}
    </div>

    <div class="ia-item__content">
        <div class="ia-item__title">
            {ia_url item='autos_services' type='link' data=$listing text=$listing.title}
        </div>

        <div class="ia-item__additional">
            <p><span class="fa fa-briefcase"></span>
                {$services = explode(',', $listing.categories)}
                {foreach $services as $service}
                    {lang key="field_autos_services_categories+{$service}"}{if !$service@last}, {/if}
                {/foreach}
            </p>
            {if isset($listing.company_phone) && $listing.company_phone}
                <p><span class="fa fa-phone"></span> {$listing.company_phone|escape}</p>
            {/if}
        </div>
        <div class="ia-item__body">{$listing.description|escape|truncate:250:'...':true}</div>
    </div>
</div>