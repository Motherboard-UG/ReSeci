import {*} with './graph.jac';
import {*} with './nodes/agent.jac';
import {*} with './nodes/users.jac';
import {*} with './nodes/global_settings.jac';
import {*} with './nodes/requests.jac';
import {*} with './nodes/user_settings.jac';
import {*} with './nodes/emails.jac';
import {*} with './nodes/logs.jac';
import {*} with './nodes/session.jac';
import {*} with './walkers/users.jac';
import {*} with './walkers/requests.jac';
import {*} with './walkers/user_setting.jac';
import {*} with './walkers/emails.jac';
import {*} with './walkers/logs.jac';
import {*} with './walkers/session.jac';
import {*} with './walkers/public.jac';





walker init {
    root: take --> node::app else: spawn here ++> graph::app_graph;
}
