- dashboard: 2_att_addressable_report
  title: 2_AT&T Addressable Report
  layout: newspaper
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: <img src="https://user-images.githubusercontent.com/42047619/44759001-86d39700-ab05-11e8-8def-f244be6e5a62.png"
      width="100%"/>
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Untitled
    name: Untitled
    model: air_project
    explore: ars_summary
    type: looker_single_record
    fields:
    - ars_summary.Last_Update_Dt
    fill_fields:
    - ars_summary.Last_Update_Dt
    filters:
      ars_summary.Last_Update_Dt: NOT NULL
    sorts:
    - ars_summary.Last_Update_Dt desc
    limit: 500
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    title_hidden: true
    row: 74
    col: 0
    width: 24
    height: 2
  - title: Average Frequency
    name: Average Frequency
    model: air_project
    explore: ars_summary
    type: single_value
    fields:
    - ars_summary.Frequency
    sorts:
    - ars_summary.Frequency
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    value_format: 0.0\
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      IO ID: ars_summary.IO_ID
      Deal Number: ars_summary.Deal_ID
    row: 4
    col: 17
    width: 7
    height: 4
  - title: Cumulative Impressions
    name: Cumulative Impressions
    model: air_project
    explore: ars_detail
    type: looker_column
    fields:
    - ars_detail.Total_Ordered_Impressions
    - ars_detail.date_week
    - ars_detail.delivered_impressions_runningTotal
    fill_fields:
    - ars_detail.date_week
    sorts:
    - ars_detail.date_week
    limit: 500
    dynamic_fields:
    - table_calculation: ordered_impressions_running_total
      label: Ordered Impressions Running Total
      expression: running_total(${ars_detail.Total_Ordered_Impressions})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: max_ordered_impressions
      label: Max Ordered Impressions
      expression: max(running_total(${ars_detail.Total_Ordered_Impressions}))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      ars_detail.Total_Ordered_Impressions: "#929292"
      ars_detail.Total_Delivered_Impressions: "#62bad4"
      max_ordered_impressions: "#929292"
    series_labels:
      ars_detail.Total_Delivered_Impressions: Delivered Impressions
      ars_detail.Total_Ordered_Impressions: Ordered Impressions
      max_ordered_impressions: Total Ordered Impressions
      delivered_impressions_running_total: Cumulative Delivered Impressions
      ars_detail.delivered_impressions_runningTotal: Delivered Impressions
    series_types:
      max_ordered_impressions: line
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: delivered_impressions_running_total
        name: Delivered Impressions Running Total
        axisId: delivered_impressions_running_total
      - id: max_ordered_impressions
        name: Total Ordered Impressions
        axisId: max_ordered_impressions
      showLabels: true
      showValues: true
      valueFormat: ''
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week Start
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b  %d"
    x_axis_datetime_tick_count: 20
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    label_value_format: "#,###"
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - ordered_impressions_running_total
    - ars_detail.Total_Ordered_Impressions
    listen:
      IO ID: ars_detail.io_id
      Deal Number: ars_detail.deal_id
    row: 8
    col: 0
    width: 12
    height: 6
  - title: Total Impressions
    name: Total Impressions
    model: air_project
    explore: ars_detail
    type: looker_bar
    fields:
    - ars_detail.Total_Delivered_Impressions
    - ars_detail.Total_Ordered_Impressions
    limit: 500
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - black
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      ars_detail.Total_Ordered_Impressions: "#929292"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: ars_detail.Total_Delivered_Impressions
        name: Total Delivered Impressions
        axisId: ars_detail.Total_Delivered_Impressions
      - id: ars_detail.Total_Ordered_Impressions
        name: Total Ordered Impressions
        axisId: ars_detail.Total_Ordered_Impressions
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      IO ID: ars_detail.io_id
      Deal Number: ars_detail.deal_id
    row: 4
    col: 0
    width: 10
    height: 4
  - title: Week-Over-Week Delivered Impressions
    name: Week-Over-Week Delivered Impressions
    model: air_project
    explore: ars_detail
    type: looker_line
    fields:
    - ars_detail.date_week
    - ars_detail.Total_Delivered_Impressions
    fill_fields:
    - ars_detail.date_week
    sorts:
    - ars_detail.date_week
    limit: 500
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - black
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ars_detail.Total_Ordered_Impressions: "#929292"
      ars_detail.Total_Delivered_Impressions: "#62bad4"
      max_ordered_impressions: "#929292"
    series_labels:
      ars_detail.Total_Delivered_Impressions: Delivered Impressions
      ars_detail.Total_Ordered_Impressions: Ordered Impressions
      max_ordered_impressions: Total Ordered Impressions
      delivered_impressions_running_total: Cumulative Delivered Impressions
      ars_detail.delivered_impressions_runningTotal: Total Delivered Impressions
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ars_detail.Total_Delivered_Impressions
        name: Delivered Impressions
        axisId: ars_detail.Total_Delivered_Impressions
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week Start
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b  %d"
    x_axis_datetime_tick_count: 20
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    label_value_format: "#,###"
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - ordered_impressions_running_total
    listen:
      IO ID: ars_detail.io_id
      Deal Number: ars_detail.deal_id
    row: 8
    col: 12
    width: 12
    height: 6
  - title: Untitled
    name: Untitled
    model: air_project
    explore: ars_detail
    type: table
    fields:
    - ars_detail.type
    - ars_detail.Total_Delivered_Impressions
    - ars_detail.daypart_custom_sort
    pivots:
    - ars_detail.daypart_custom_sort
    fill_fields:
    - ars_detail.daypart_custom_sort
    - ars_detail.type
    sorts:
    - ars_detail.type
    - ars_detail.daypart_custom_sort 0
    limit: 500
    total: true
    row_total: right
    dynamic_fields:
    - table_calculation: of_total
      label: "% of Total"
      expression: "(${ars_detail.Total_Delivered_Impressions})/(${ars_detail.Total_Delivered_Impressions:total})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: concat
      label: Concat
      expression: concat(${ars_detail.Total_Delivered_Impressions},"-",(${ars_detail.Total_Delivered_Impressions})/(${ars_detail.Total_Delivered_Impressions:total})*100,"%")
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: string
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ars_detail.daypart: Daypart
      ars_detail.Total_Delivered_Impressions: Delivered Impressions
      ars_detail.daypart_custom_sort: Daypart
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - sort
    - calculation_3
    - calculation
    - concat
    listen:
      Deal Number: ars_detail.deal_id
    title_hidden: true
    row: 32
    col: 0
    width: 24
    height: 4
  - title: Week-Over-Week Reach
    name: Week-Over-Week Reach
    model: air_project
    explore: ars_detail
    type: looker_line
    fields:
    - ars_detail.date_week
    - ars_detail.Reach_PercentOfTotal
    fill_fields:
    - ars_detail.date_week
    sorts:
    - ars_detail.date_week
    limit: 500
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color:
    - black
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ars_detail.Total_Ordered_Impressions: "#929292"
      ars_detail.Total_Delivered_Impressions: "#62bad4"
      max_ordered_impressions: "#929292"
      ars_detail.total_reach: "#4da221"
      ars_detail.Reach_PercentOfTotal: "#4da221"
    series_labels:
      ars_detail.Total_Delivered_Impressions: Delivered Impressions
      ars_detail.Total_Ordered_Impressions: Ordered Impressions
      max_ordered_impressions: Total Ordered Impressions
      delivered_impressions_running_total: Cumulative Delivered Impressions
      ars_detail.delivered_impressions_runningTotal: Total Delivered Impressions
      ars_detail.Reach_PercentOfTotal: "% of Total"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ars_detail.Reach_PercentOfTotal
        name: "% of Total"
        axisId: ars_detail.Reach_PercentOfTotal
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week Start
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b  %d"
    x_axis_datetime_tick_count: 20
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    label_value_format: ''
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - ordered_impressions_running_total
    listen:
      IO ID: ars_detail.io_id
      Deal Number: ars_detail.deal_id
    row: 14
    col: 12
    width: 12
    height: 6
  - title: Cumulative Reach
    name: Cumulative Reach
    model: air_project
    explore: ars_detail
    type: looker_column
    fields:
    - ars_detail.date_week
    - ars_detail.total_reach
    - ars_detail.avg_Frequency
    fill_fields:
    - ars_detail.date_week
    sorts:
    - ars_detail.date_week
    limit: 500
    dynamic_fields:
    - table_calculation: running_total
      label: Running Total
      expression: running_total(${ars_detail.total_reach})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: running_total_2
      label: Running Total %
      expression: "${running_total}/sum(${ars_detail.total_reach})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    colors:
    - 'palette: Santa Cruz'
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors:
      ars_detail.avg_Frequency: "#e9b404"
      running_total: "#9fc190"
      running_total_2: "#4da221"
    series_labels:
      ars_detail.avg_Frequency: Average Weekly Frequency
      running_total: Cumulative Reach
      running_total_2: Cumulative Reach %
    series_types:
      ars_detail.avg_Frequency: scatter
    limit_displayed_rows: false
    hidden_series:
    - ars_detail.avg_Frequency
    y_axes:
    - label: Reach %
      orientation: left
      series:
      - id: running_total_2
        name: Cumulative Reach %
        axisId: running_total_2
      showLabels: true
      showValues: true
      valueFormat: ''
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: ars_detail.avg_Frequency
        name: Average Frequency
        axisId: ars_detail.avg_Frequency
      showLabels: true
      showValues: true
      valueFormat: '0'
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week Start
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b  %d"
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - ars_detail.total_reach
    - running_total
    listen:
      IO ID: ars_detail.io_id
      Deal Number: ars_detail.deal_id
    row: 14
    col: 0
    width: 12
    height: 6
  - title: Campaign & Deal Information
    name: Campaign & Deal Information
    model: air_project
    explore: ars_summary
    type: looker_single_record
    fields:
    - ars_summary.Advertiser_Name2
    - ars_summary.Agency_Name2
    - ars_summary.Deal_ID2
    - ars_summary.flight_concat2
    - ars_summary.io_id_custom2
    - ars_summary.IO_Name2
    - ars_summary.Target2
    filters: {}
    limit: 500
    show_view_names: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      IO ID: ars_summary.IO_ID
      Deal Number: ars_summary.Deal_ID
    row: 0
    col: 0
    width: 20
    height: 4
  - title: Top 5 Channels by Impressions
    name: Top 5 Channels by Impressions
    model: air_project
    explore: cs_network
    type: looker_bar
    fields:
    - cs_network.network
    - cs_network.Total_Impressions
    sorts:
    - cs_network.Total_Impressions desc
    limit: 500
    stacking: ''
    colors:
    - 'palette: Santa Cruz'
    show_value_labels: true
    label_density: 25
    label_color:
    - black
    font_size: ''
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      cs_network.Total_Impressions: "#abc43d"
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: cs_network.Total_Impressions
        name: Total Impressions
        axisId: cs_network.Total_Impressions
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    label_value_format: ''
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 36
    col: 0
    width: 24
    height: 5
  - title: Impressions by Channel
    name: Impressions by Channel
    model: air_project
    explore: cs_network
    type: looker_bar
    fields:
    - cs_network.Total_Impressions
    - cs_network.network
    sorts:
    - cs_network.network
    limit: 500
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: 9px
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      cs_network.Total_Impressions: "#62bad4#929292"
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '30'
    y_axes:
    - label: Impressions (in millions)
      orientation: bottom
      series:
      - id: cs_network.Total_Impressions
        name: Total Impressions
        axisId: cs_network.Total_Impressions
      showLabels: false
      showValues: false
      maxValue:
      valueFormat: 0.0,," M"
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 4
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    listen: {}
    row: 41
    col: 0
    width: 24
    height: 33
  - title: Reach
    name: Reach
    model: air_project
    explore: ars_summary
    type: single_value
    fields:
    - ars_summary.Total_Reach
    - ars_summary.Total_Target_Est
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Target Universe
    listen:
      IO ID: ars_summary.IO_ID
      Deal Number: ars_summary.Deal_ID
    row: 4
    col: 10
    width: 7
    height: 4
  - title: Impressions by Daypart
    name: Impressions by Daypart
    model: air_project
    explore: ars_detail
    type: looker_column
    fields:
    - ars_detail.Total_Delivered_Impressions
    - ars_detail.type
    - ars_detail.daypart_custom_sort
    pivots:
    - ars_detail.type
    fill_fields:
    - ars_detail.daypart_custom_sort
    filters:
      ars_detail.type: "-NULL"
    sorts:
    - ars_detail.type 0
    - ars_detail.daypart_custom_sort
    limit: 500
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      Live - ars_detail.Total_Delivered_Impressions: "#d17b3f"
      DVR - 1 - ars_detail.Total_Delivered_Impressions: "#c59a74"
    series_labels:
      DVR - ars_detail.Total_Delivered_Impressions: DVR Delivered Impressions
      Live - ars_detail.Total_Delivered_Impressions: Live Delivered Impressions
      VOD - ars_detail.Total_Delivered_Impressions: VOD Delivered Impressions
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - sort
    listen:
      Household Frequency - Bucket 3: ars_detail.bucket_3
      Deal Number: ars_detail.deal_id
    row: 26
    col: 0
    width: 24
    height: 6
  - title: Household Frequency
    name: Household Frequency
    model: air_project
    explore: ars_detail
    type: looker_column
    fields:
    - ars_detail.count
    - ars_detail.tier2
    filters:
      ars_detail.bucket_3: '30'
    sorts:
    - ars_detail.tier2
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: of_total
      label: "% of Total"
      expression: "${ars_detail.count} / ${ars_detail.count:total}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    label_color:
    - black
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      ars_detail.count: "#e8c443"
      of_total: "#e0d13d"
    series_labels:
      of_total: "% of Total Households"
    limit_displayed_rows: false
    y_axes:
    - label: "% of Total Households"
      orientation: left
      series:
      - id: of_total
        name: "% of Total"
        axisId: of_total
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - ars_detail.count
    listen:
      Exclude Frequency Outliers?: ars_detail.frequencyOutlier
      Household Frequency - Bucket 1: ars_detail.bucket_1
      Household Frequency - Bucket 2: ars_detail.bucket_2
      Household Frequency - Bucket 4: ars_detail.bucket_4
      Deal Number: ars_detail.deal_id
    row: 20
    col: 0
    width: 24
    height: 6
  filters:
  - name: IO ID
    title: IO ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_summary
    listens_to_filters:
    - Deal Number
    field: ars_summary.io_id_custom2
  - name: Frequency
    title: Frequency
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.frequency
  - name: Exclude Frequency Outliers?
    title: Exclude Frequency Outliers?
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.frequencyOutlier
  - name: Household Frequency - Bucket 1
    title: Household Frequency - Bucket 1
    type: field_filter
    default_value: '10'
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.bucket_1
  - name: Household Frequency - Bucket 2
    title: Household Frequency - Bucket 2
    type: field_filter
    default_value: '20'
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.bucket_2
  - name: Household Frequency - Bucket 3
    title: Household Frequency - Bucket 3
    type: field_filter
    default_value: '30'
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.bucket_3
  - name: Household Frequency - Bucket 4
    title: Household Frequency - Bucket 4
    type: field_filter
    default_value: '40'
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_detail
    listens_to_filters: []
    field: ars_detail.bucket_4
  - name: Deal Number
    title: Deal Number
    type: field_filter
    default_value: DIRECTTV700,DIRECTTV800
    allow_multiple_values: true
    required: false
    model: air_project
    explore: ars_summary
    listens_to_filters: []
    field: ars_summary.Deal_ID2
