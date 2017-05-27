{if isset($author)}
<div class="enquire">
    <div class="enquire__header">
        {lang key='enquire_on_this_car'}
    </div>
    <div class="enquire__content">
        <form action="{$core.packages.autos.url}system.json" method="post" id="js-enq-car-form">
            <p class="enquire__info">{lang key='enquire_top_text'}</p>
            <div class="form-group">
                <input type="text" id="from-name" name="from_name" class="form-control" placeholder="{lang key='your_name'}">
            </div>
            <div class="form-group">
                <input type="text" id="from-email" name="from_email" class="form-control" placeholder="{lang key='your_email'}">
            </div>
            <div class="form-group">
                <input type="text" id="from-phone" name="from_phone" class="form-control" placeholder="{lang key='your_phone'}">
            </div>
            <div class="form-group">
                <textarea id="email-body" name="email_body" class="form-control" rows="4" placeholder="{lang key='your_comments'}"></textarea>
            </div>

            {if !$member}
                <div class="form-group m-t">
                    <div class="captcha">
                        {captcha}
                    </div>
                </div>
            {/if}

            <button class="btn btn-primary btn-block" type="submit">{lang key='send_enquiry'}</button>

            <input type="hidden" name="action" value="send_email">
            <input type="hidden" name="author_id" value="{$author.id}">
            <input type="hidden" name="regarding" value="{$core.page.title|escape}">
            <input type="hidden" name="item_id" value="{$item.id}">
        </form>
    </div>
</div>
{ia_add_js}
$(function()
{
    $('#js-enq-car-form').on('submit', function(e)
    {
        e.preventDefault();

        var $form = $(this), data = { };

        $form.serializeArray().map(function(x){ data[x.name] = x.value; })
        {*if ('' != data.email_body && '' != data.from_phone) data.email_body+= '\n\nPhone: ' + data.from_phone;*}

    $.post($form.attr('action'), data, function(response)
        {
            if (!response.error) $('[type="submit"], input, textarea', $form).prop('disabled', true);
            intelli.notifFloatBox({ msg: response.message, type: response.error ? 'error' : 'success', autohide: true });
        });
    });
});
{/ia_add_js}
{/if}