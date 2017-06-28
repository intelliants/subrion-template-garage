{if isset($filters.item)}
    <form class="ia-form ia-form-filters" id="js-item-filters-form" data-item="{$filters.item}" action="{$smarty.const.IA_URL}search/{$filters.item}.json">
        {if !$core.config.search_instant}
            <button class="ia-form-filters__apply js-cmd-apply-param" type="submit">{lang key='apply'}</button>
        {/if}

        {ia_hooker name='smartyFrontFiltersBeforeFields'}

        {foreach $filters.fields as $field}
            {if !empty($filters.params[$field.name])}
                {$selected = $filters.params[$field.name]}
            {else}
                {$selected = null}
            {/if}
            <div class="form-group">
                {if $field.type !== iaField::STORAGE && $field.type !== iaField::IMAGE && $field.type !== iaField::PICTURES}
                    <label>{lang key="field_{$field.item}_{$field.name}"}</label>
                {/if}
                {switch $field.type}
                    {case iaField::CHECKBOX break}
                        <div class="radios-list">
                            {html_checkboxes assign='checkboxes' name=$field.name options=$field.values separator='</div>' selected=$selected}
                            <div class="checkbox">{'<div class="checkbox">'|implode:$checkboxes}
                        </div>

                    {case iaField::COMBO break}
                        <select class="form-control js-interactive" name="{$field.name}[]" multiple>
                            {if !empty($field.values)}
                                {html_options options=$field.values selected=$selected}
                            {/if}
                        </select>

                    {case iaField::RADIO break}
                        <div class="radios-list">
                            {if !empty($field.values)}
                                {html_radios assign='radios' name=$field.name id=$field.name options=$field.values separator='</div>'}
                                <div class="radio">{'<div class="radio">'|implode:$radios}
                            {/if}
                        </div>

                    {case iaField::STORAGE}
                    {case iaField::IMAGE}
                    {case iaField::PICTURES break}
                            <div class="checkbox checkbox-awesome checkbox-dark">
                                <input type="checkbox" name="{$field.name}" id="{$field.name}" value="1"{if $selected} checked{/if}>
                                <label for="{$field.name}">
                                    <strong>{lang key="field_{$field.item}_{$field.name}"}</strong>
                                </label>
                            </div>

                    {case iaField::NUMBER break}
                        <div class="range-slider">
                            <input class="hidden no-js js-range-slider" id="range_{$field.name}" type="text" name="">

                            <input id="range_{$field.name}_from" type="hidden" name="{$field.name}[f]" maxlength="{$field.length}"  value="{if $selected} {$selected.f|escape}{else}{$field.range[0]|escape}{/if}">
                            <input id="range_{$field.name}_to" type="hidden" name="{$field.name}[t]" maxlength="{$field.length}"  value="{if $selected}{$selected.t|escape}{else}{$field.range[1]|escape}{/if}">

                            {ia_add_js}
$(function()
{
    $('#range_{$field.name}').ionRangeSlider(
    {
        type: 'double',
        force_edges: true,
        min: '{$field.range[0]}',
        max: '{$field.range[1]}',
        from: $('#range_{$field.name}_from').val(),
        to: $('#range_{$field.name}_to').val(),
        {if 'release_year' == $field.name}
            prettify_enabled: false,
            step: 1,
        {else}
            step: 1000,
        {/if}
        onFinish: function(obj)
        {
            $('#range_{$field.name}_from').val(obj.from).trigger('change');
            $('#range_{$field.name}_to').val(obj.to).trigger('change');
        }
    });

    var ionSlider_{$field.name} = $('#range_{$field.name}').data('ionRangeSlider');

    $('#range_{$field.name}_from').on('change', function() {
        var thisval = $(this).val();

        ionSlider_{$field.name}.update({
            from: thisval
        });
    });

    $('#range_{$field.name}_to').on('change', function() {
        var thisval = $(this).val();

        ionSlider_{$field.name}.update({
            to: thisval
        });
    });
});
                            {/ia_add_js}
                        </div>

                    {case iaField::TEXT}
                    {case iaField::TEXTAREA break}
                        <input class="form-control" type="text" name="{$field.name}"{if is_string($selected)} value="{$selected|escape}"{/if}>

                    {case iaField::TREE}
                        <select class="form-control" name="{$field.name}[]" multiple>
                            <option value="">&lt;{lang key='any'}&gt;</option>
                            {if !empty($field.values)}
                                {html_options options=$field.values selected=$selected}
                            {/if}
                        </select>
                {/switch}
            </div>
        {/foreach}

        {ia_hooker name='smartyFrontFiltersAfterFields'}

        {if $member}
            <div class="ia-form-filters__actions">
                <a href="{$smarty.const.IA_URL}search/my/" class="" data-loading-text="{lang key='loading'}" id="js-cmd-open-searches">
                    <span class="fa fa-list"></span>
                    {lang key='my_searches'}
                </a>
                <div class="modal fade" id="js-modal-searches" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document"><div class="modal-content"></div></div>
                </div>
                {if isset($regular)}
                    <a href="#" class="" id="js-cmd-save-search">
                        <span class="fa fa-search-plus"></span>
                        {lang key='save_this_search'}
                    </a>
                {/if}
            </div>
        {/if}
    </form>
    {ia_add_media files='select2, js:intelli/intelli.search, js:frontend/search, js:_IA_TPL_ion.rangeSlider.min, css:ion.rangeSlider'}
{/if}