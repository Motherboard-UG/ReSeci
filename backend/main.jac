import {*} with './graph.jac';
import {*} with './nodes/agent.jac';
import {*} with './nodes/users.jac';
import {*} with './nodes/global_settings.jac';
import {*} with './nodes/requests.jac';
import {*} with './nodes/user_settings.jac';
import {*} with './nodes/emails.jac';
import {*} with './nodes/logs.jac';
import {*} with './nodes/session.jac';




walker init {
    root: take --> node::app else: spawn here ++> graph::app_graph;
}
