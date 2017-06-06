<div class="ia-item-view service-view {$item.status}" id="service-{$item.id}">
    {if !empty($item.pictures)}
        {ia_add_media files='fotorama'}
        <div class="ia-item-view__gallery">
            <div class="fotorama"
                 data-nav="thumbs"
                 data-width="100%"
                 data-ratio="16/9"
                 data-allowfullscreen="true"
                 data-fit="cover">
                {foreach $item.pictures as $entry}
                    <a class="ia-item-view__gallery__item" href="{ia_image file=$entry type='large' url=true}">{ia_image file=$entry type='thumbnail' title=$entry.title}</a>
                {/foreach}
            </div>
        </div>
    {/if}

    {ia_hooker name='smartyItemViewBeforeTabs'}

    {include 'item-view-tabs.tpl' isView=true exceptions=['pictures', 'logo'] class='ia-item-view-tabs'}

    {ia_hooker name='smartyViewListingBeforeFooter'}
</div>