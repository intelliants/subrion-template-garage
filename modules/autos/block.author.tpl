{if !empty($author)}
    <div class="ia-item-author">
        <div class="row">
            <div class="col-md-{if !empty($author.longitude) && !empty($author.latitude)}6{else}12{/if}">
                <div class="ia-item-author__content">
                    <div class="ia-item-author__caption">{lang key='seller'}</div>
                    <a class="ia-item-author__image" href="{$author.link}">
                        {ia_image file=$author.avatar type='thumbnail' width=120 title=$author.fullname|default:$author.username gravatar=true email=$author.email}
                    </a>
                    <h4 class="ia-item__title"><a href="{$author.link}">{$author.fullname|escape}</a></h4>
                    <div class="ia-item__additional">
                        <p>{lang key='cars_in_garage'}: <strong>{$author.autos_num|string_format:'%d'}</strong></p>

                        {if !empty($author.phone) || $core.config.autos_callback_request}
                            <p>
                                {if !empty($author.phone)}
                                    {lang key='field_members_phone'}: <strong>{$author.phone|escape}</strong>
                                {/if}
                                {if $core.config.autos_callback_request}
                                    <a class="request-toggle js-request-toggle" href="#" data-toggle="modal" data-target="#callbackModal">{lang key='request_callback'}</a>
                                {/if}
                            </p>
                        {/if}

                        {if $core.config.autos_callback_request}
                            <div class="modal fade" id="callbackModal">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">{lang key='request_callback'}</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <form action="{$core.packages.autos.url}system.json" method="post" id="js-enq-callback-form">
                                                    <div class="form-group">
                                                        <label for="request_time">{lang key='best_time'}</label>
                                                        <select class="form-control" name="best_time" id="request_time">
                                                            <option>{lang key='morning'}</option>
                                                            <option>{lang key='evening'}</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="phone" class="form-control" maxlength="20" placeholder="{lang key='your_phone'}">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea name="comment" class="form-control" rows="4" placeholder="{lang key='your_comments'}"></textarea>
                                                    </div>

                                                    {if !$member}
                                                        <div class="form-group m-t">
                                                            <div class="captcha">
                                                                {captcha}
                                                            </div>
                                                        </div>
                                                    {/if}

                                                    <button class="btn btn-primary btn-block" type="submit">{lang key='send_request'}</button>

                                                    <input type="hidden" name="action" value="callback-request">
                                                    <input type="hidden" name="author" value="{$author.id}">
                                                    <input type="hidden" name="title" value="{$core.page.title|escape}">
                                                </form>
                                                {ia_add_js}
$(function() {
    $('#js-enq-callback-form').on('submit', function(e) {
        e.preventDefault();

        var $form = $(this);

        $.post($form.attr('action'), $form.serialize(), function(response) {
            if (!response.error) $('button, input, textarea, select', $form).prop('disabled', true);
            intelli.notifFloatBox({ msg: response.message, type: response.error ? 'error' : 'success', autohide: true });
        });
    });
});
                                                {/ia_add_js}
                                            </div>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        {/if}

                        {if $author.facebook || $author.twitter || $author.gplus || $author.linkedin}
                            <div class="ia-item-author__social">
                                {if !empty($author.facebook)}
                                    <a href="{$author.facebook}" target="_blank"><i class="fa fa-facebook"></i></a>
                                {/if}
                                {if !empty($author.twitter)}
                                    <a href="{$author.twitter}" target="_blank"><i class="fa fa-twitter"></i></a>
                                {/if}
                                {if !empty($author.gplus)}
                                    <a href="{$author.gplus}" target="_blank"><i class="fa fa-google-plus"></i></a>
                                {/if}
                                {if !empty($author.linkedin)}
                                    <a href="{$author.linkedin}" target="_blank"><i class="fa fa-linkedin"></i></a>
                                {/if}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            {if !empty($author.longitude) && !empty($author.latitude)}
                <div class="col-md-6">
                    <div class="ia-item-author__map">
                        <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
                        <div id="gmap"></div>
                        {ia_add_js}
function init_map() {
    var myOptions = {
        zoom: 10,
        center: new google.maps.LatLng({$author.latitude},{$author.longitude}),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('gmap'), myOptions);

    marker = new google.maps.Marker({
        map: map,
        position: new google.maps.LatLng({$author.latitude},{$author.longitude})
    });
}

google.maps.event.addDomListener(window, 'load', init_map);
                        {/ia_add_js}
                    </div>
                </div>
            {/if}
        </div>
        {ia_hooker name='smartyViewListingAuthorBlock'}
    </div>
{/if}