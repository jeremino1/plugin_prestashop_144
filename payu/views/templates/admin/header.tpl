{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<script type="text/javascript" src="{$module_dir|escape:'htmlall':'UTF-8'}js/back_office.js"></script>
{if $show_refund}
    {capture assign=refund_fieldset}
        <fieldset>
            <legend><img src="{$module_dir|escape:'htmlall':'UTF-8'}/logo.gif" alt="" />{l s='Make a full or partial refund' mod='payu'}</legend>
            <form action="" method="post" onsubmit="return confirm('Do you really want to submit the refund request?');">
                <select name="payu_refund_type" id="payu_refund_type">
                    <option value="full"{if $payu_refund_type eq "full"} selected="selected"{/if}>Full refund</option>
                    <option value="partial"{if $payu_refund_type eq "partial"} selected="selected"{/if}>Partial refund</option>
                </select>
                <label style="float: none">
                    amount
                    <input type="text" id="payu_refund_amount" name="payu_refund_amount" value="{$payu_refund_amount|escape:'htmlall':'UTF-8'}"/>
                </label>
                <input type="submit" name="submitPayuRefund" class="button" value="{l s='Perform refund' mod='payu'}"/>
            </form>
            {if $payu_refund_errors|count}
                <br/>
                {foreach from = $payu_refund_errors item = error}
                <p class="error">{$error|escape:'htmlall':'UTF-8'}</p>
                {/foreach}
            {/if}
        </fieldset>
        <br/>
        <script>
            {literal}
            $(document).ready(function() {
                var refund_type_select = $('#payu_refund_type');
                var set_type = function(type) {
                    if ('full' == type) {
                        $('#payu_refund_amount').attr('readonly', true).val('{/literal}{$payu_refund_full_amount|escape:'htmlall':'UTF-8'}{literal}');
                    } else {
                        $('#payu_refund_amount').attr('readonly', false);
                    }
                };
                set_type(refund_type_select.val());
                refund_type_select.on('change', function(){
                    set_type(refund_type_select.val());
                });
            });
            {/literal}
        </script>
    {/capture}
    <script>
        $(document).ready(function() {
            $("{$refund_fieldset|escape:'javascript':'UTF-8'}").insertBefore($('select[name=id_order_state]').parent().parent().find('fieldset').first());
        });
    </script>
{/if}
