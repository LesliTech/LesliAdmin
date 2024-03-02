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
import { computed } from "vue"


// · import lesli stores
import { useAccount } from "Lesli/vue/shared/stores/account"


// · implement stores
const storeAccount = useAccount()


// · translations
const translations = {
    shared: i18n.t("lesli.shared"),
    admin: i18n.t("lesli_admin.accounts"),
}


// . get reactive info from onboarding store
const companyInfo = computed(()=> storeOnboarding.companyInfo)

</script>
<template>
    <lesli-form flat @submit="storeAccount.update">
        <div class="field">
            <label class="label">{{ translations.admin.column_public_email }}</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.public_email" />
            </div>
        </div>

        <div class="field">
            <label class="label">{{translations.admin.column_phone_number}}</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.phone_number_1" />
            </div>
        </div>

        <p class="my-5">{{translations.admin.view_subtitle_social_media }}</p>

        <div class="field">
            <label class="label">Github</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.github" />
            </div>
        </div>

        <div class="field">
            <label class="label">Twitter</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.twitter" />
            </div>
        </div>

        <div class="field">
            <label class="label">YouTube</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.youtube" />
            </div>
        </div>

        <div class="field">
            <label class="label">Linkedin</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.linkedin" />
            </div>
        </div>

        <div class="field">
            <label class="label">Facebook</label>
            <div class="control">
                <input class="input" type="text" v-model="storeAccount.accountInfo.facebook" />
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
