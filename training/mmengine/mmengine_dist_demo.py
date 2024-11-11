import os
import argparse

import mmengine.dist as dist
import torch

def show_reduce(rank):
  data = torch.arange(2, dtype=torch.int64) + 1 + 2 * rank
  data = dist.all_reduce(data, op="sum")
  print(data)

def show_dist_info():
  print(dist.get_world_size())
  print(dist.get_rank())
  print(dist.get_backend())
  print(dist.get_dist_info())

def show_env():
  keys = ["WORLD_SIZE", "RANK", "LOCAL_WORLD_SIZE", "LOCAL_RANK", "GROUP_WORLD_SIZE", "GROUP_RANK", "ROLE_WORLD_SIZE", "ROLE_RANK", "ROLE_NAME"]
  for key in keys:
    value = os.environ.get(key)
    if value is not None:
      print(f'{key}: {value}')

def parse_args():
    parser = argparse.ArgumentParser(description='Distributed Training')
    parser.add_argument(
        '--launcher',
        choices=['none', 'pytorch', 'slurm', 'mpi'],
        default='none',
        help='job launcher')
    parser.add_argument('--local_rank', type=int, default=0)

    args = parser.parse_args()
    return args

def main():
    args = parse_args()
    show_env()

    dist.init_dist(args.launcher)
    show_dist_info()

    show_reduce(dist.get_rank())

if __name__ == '__main__':
    main()
