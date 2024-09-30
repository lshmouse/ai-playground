"""Launch a talker and a listener."""
import launch
import launch_ros.actions

def generate_launch_description():
    """Launch a talker and a listener."""
    return launch.LaunchDescription([
        launch_ros.actions.Node(
            # Provide the rootpath for the node.
            executable='chatter/talker',
            output='screen',
            name='ros_talker'),
        launch_ros.actions.Node(executable='chatter/listener',
                                output='screen',
                                name='ros_listener'),
    ])