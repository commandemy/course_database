# cookbook_course_database

This cookbook creates a MySQL database for use with the example sinatra app.

To be able to run tests with Test Kitchen, please create a .kitchen.yml file.
A .kitchen.sample.yml file is provided as template.


## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['course_database']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### course_database::default

Include `course_database` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[course_database::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)