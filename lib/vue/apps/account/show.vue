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
import { computed, onMounted } from "vue"


// · import lesli stores
import { useAccount } from "LesliAdmin/vue/stores/account"


// · import account components
import formInformation from "./components/form-information.vue"
import formAddress from "./components/form-address.vue"
import formContact from "./components/form-contact.vue"


// · implement stores
const storeAccount = useAccount()


// · translations
const translations = {
    admin: i18n.t("lesli_admin.accounts")
}


// . get reactive info from onboarding store
const companyInfo = computed(()=> storeOnboarding.companyInfo)


// . 
onMounted(() => {
    storeAccount.get()
})

</script>
<template>
    <lesli-application-container>
        <lesli-header :title="translations.admin.view_title">
        </lesli-header>
        <lesli-tabs>
            <lesli-tab-item :title="translations.admin.tab_general_information" icon="business">
                <form-information></form-information>
            </lesli-tab-item>
            <!--
            <lesli-tab-item :title="translations.admin.tab_address" icon="location_on">
                <form-address></form-address>
            </lesli-tab-item>
            
            <lesli-tab-item :title="translations.admin.tab_contact" icon="contact_page">
            <form-contact></form-contact>
            </lesli-tab-item>
            -->
        </lesli-tabs>
    </lesli-application-container>
</template>
