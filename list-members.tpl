<div class="ia-item ia-item--member">
    <div class="ia-item__actions">
        {printFavorites item=$listing itemtype='members' guests=true}
    </div>
    <div class="ia-item__image">
        {ia_image file=$listing.avatar type='thumbnail' title=$listing.fullname|default:$listing.username gravatar=true email=$listing.email gravatar_width=200}
    </div>
    <div class="ia-item__content">
        <h4 class="ia-item__title">
            <a href="{$listing.link}">{$listing.fullname|default:$listing.username}</a>
        </h4>
    </div>
</div>