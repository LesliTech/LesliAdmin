<script setup>
/*
Lesli

Copyright (c) 2023, Lesli Technologies, S. A.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see http://www.gnu.org/licenses/.

Lesli · Ruby on Rails SaaS Development Framework.

Made with ♥ by https://www.lesli.tech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
*/


// · import vue tools
import { ref, reactive, onMounted, watch, computed } from "vue"


// · import lesli stores
import { useAccount } from "LesliAdmin/vue/stores/account"


// · implement stores
const storeAccount = useAccount()


// · 
const translations = {
    shared: i18n.t("lesli.shared"),
    admin: i18n.t("lesli_admin.accounts"),
}

</script>
<template>
    <lesli-form flat @submit="storeAccount.update">

        <div class="field">
            <label class="label">{{ translations.admin.column_company_name }}</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.account.name" >
            </div>
        </div>

        <div class="field">
            <label class="label">{{ translations.admin.column_company_name_legal }}</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.account.detail_attributes.company_name_legal">
            </div>
        </div>

        <div class="field">
            <label class="label">{{ translations.admin.column_tag_line }}</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.account.detail_attributes.company_tagline">
            </div>
        </div>

        <div class="field">
            <div class="field-body">
                <div class="field">
                    <div class="control">
                        <lesli-button icon="save">
                            {{ translations.shared.button_save }}
                        </lesli-button>                 
                    </div>
                </div>
            </div>
        </div>
    </lesli-form>
</template>    
