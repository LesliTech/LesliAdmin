<script setup>

import { lesliChartLine } from "lesli-vue/components"

</script>
<template>
    <lesli-application-container>
        <lesli-header title="Dashboard"></lesli-header>

        <div class="columns">
            <div class="column">
                <lesli-application-component>
                    <lesli-chart-line 
                        title="My daily activity graph"
                        :series="[{ data:[4, 1, 4, 2, 5] }]"
                        :labels="['Monday','Tuesday','Wednesday', 'Thursday', 'Friday']">
                    </lesli-chart-line>
                </lesli-application-component>
            </div>
            <div class="column">
                <lesli-application-component>
                    <lesli-chart-line 
                        title="My daily activity graph"
                        :series="[{ name: 'Last week', data:[4, 1, 4, 2, 5] }, { name: 'Current week', data:[3, 2, 5, 4, 2] }]"
                        :labels="['Monday','Tuesday','Wednesday', 'Thursday', 'Friday']">
                    </lesli-chart-line>
                </lesli-application-component>
            </div>
        </div>
    </lesli-application-container>
</template>
