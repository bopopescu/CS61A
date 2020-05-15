# -*- coding: utf-8 -*- #
# Copyright 2015 Google LLC. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Command for getting IAM policies for device registries."""

from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals

from googlecloudsdk.api_lib.cloudiot import registries
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.iot import resource_args


@base.ReleaseTracks(base.ReleaseTrack.GA, base.ReleaseTrack.BETA)
class GetIamPolicy(base.ListCommand):
  """Get the IAM policy for a device registry.

  This command gets the IAM policy for a device registry. If formatted as
  JSON, the output can be edited and used as a policy file for
  set-iam-policy. The output includes an "etag" field identifying the version
  emitted and allowing detection of concurrent policy updates; see
  $ gcloud iot registries set-iam-policy for additional details.
  """

  detailed_help = {
      'DESCRIPTION':
          '{description}',
      'EXAMPLES':
          """\
          To print the IAM policy for a given device registry, run:

            $ {command} --region us-central1 my-registry
          """,
  }

  @staticmethod
  def Args(parser):
    resource_args.AddRegistryResourceArg(parser, 'for which to get IAM policy')
    base.URI_FLAG.RemoveFromParser(parser)

  def Run(self, args):
    client = registries.RegistriesClient()
    registry_ref = args.CONCEPTS.registry.Parse()

    return client.GetIamPolicy(registry_ref)
